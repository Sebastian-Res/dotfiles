package main

import (
	"fmt"
	"log"
	"os"
	"path"
	"path/filepath"

	"go.yaml.in/yaml/v4"
)

const YAML_PATH string = "./configuration.yaml"

type Configurations struct {
	Configs []Config `yaml:"configs"`
}

type Config struct {
	Name  string       `yaml:"name"`
	Files []ConfigFile `yaml:"files"`
}

type ConfigFile struct {
	Src_path      string `yaml:"src_path"`
	Target_folder string `yaml:"target_folder"`
}

// Reads the configuration file and checks if the files exist
func ReadConfigurationFile() Configurations {
	content, err := os.ReadFile(YAML_PATH)
	if err != nil {
		log.Fatal(err)
	}

	// Decode YAML to Go struct
	var configurations Configurations
	err = yaml.Unmarshal(content, &configurations)

	if err != nil {
		panic(err)
	}

	// Check if all listed files exist
	config_correct, err := configurations.checkSrcFileExist()
	if err != nil {
		panic(err)
	}
	if !config_correct {
		panic("At least one src file does not exist!")
	}

	return configurations
}

func (c Configurations) checkSrcFileExist() (bool, error) {
	file_exists := true
	var err error
	for _, config := range c.Configs {
		for _, file := range config.Files {
			file_exists, err = exists(file.Src_path)
			if !file_exists {
				return file_exists, err
			}
		}
	}
	return file_exists, err
}

func expandTilde(path string) (string, error) {
	if len(path) > 0 && path[0] == '~' {
		homeDir, err := os.UserHomeDir()
		if err != nil {
			return "", err
		}
		return filepath.Join(homeDir, path[1:]), nil
	}
	return path, nil
}

// Returns the absolute Path of 'path_to_file'
func getAbsolutePath(path_to_file string) (string, error) {
	path_to_file, err := expandTilde(path_to_file)
	if err != nil {
		return "", err
	}

	if !filepath.IsAbs(path_to_file) {
		path_to_file, _ = filepath.Abs(path_to_file)
	}

	_, err = os.Stat(path_to_file)
	if err != nil {
		fmt.Println("ERROR FILE/FOLDER DOES NOT EXIST")
	}

	return path_to_file, nil
}

// Returns a bool if the file at 'path' exists
func exists(path string) (bool, error) {
	_, err := os.Stat(path)
	if err == nil {
		return true, nil
	}
	if os.IsNotExist(err) {
		return false, nil
	}
	return false, err
}

func prepare_src_file(src_path string) (string, string, error) {
	// Get absolut path of src path
	path_to_file, err := getAbsolutePath(src_path)
	if err != nil {
		return "", "", err
	}

	// Get file/folder name
	_, file_name := path.Split(path_to_file)

	return path_to_file, file_name, nil
}

func prepare_target_folder(Target_folder string) (string, error) {
	// Expand tilde if in path of target folder
	target_folder, err := expandTilde(Target_folder)
	if err != nil {
		return "", err
	}

	// Get absolut path of target folder
	target_folder, err = filepath.Abs(target_folder)
	if err != nil {
		return "", err
	}

	// Check if target folder exists
	exists, err := exists(target_folder)
	if !exists && (err == nil) {
		os.Mkdir(target_folder, os.ModeDir)
	}
	if err != nil {
		return "", err
	}

	return target_folder, nil
}

func LinkFile(Src_path string, Target_folder string) OperationResult {

	path_to_file, file_name, err := prepare_src_file(Src_path)

	target_folder, err := prepare_target_folder(Target_folder)

	// Create path of the symlink (target folder + src file)
	target_path := path.Join(target_folder, file_name)

	// Check if file/symlink exists
	exists, err := exists(target_path)
	if exists {
		return OperationResult{false, "Target file already exists!"}
	}
	if err != nil {
		return OperationResult{false, err.Error()}
	}

	// Create symlink
	err = os.Symlink(path_to_file, target_path)
	if err != nil {
		return OperationResult{false, err.Error()}
	}

	return OperationResult{true, ""}
}

func CopyFile(Src_path string, Target_folder string) error {
	return nil
}

func BackupFile(Src_path string, Target_folder string) error {
	return nil
}

func DeleteFile(Src_path string, Target_folder string) error {
	return nil
}
