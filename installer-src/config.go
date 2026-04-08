package main

import (
	"log"
	"os"

	"go.yaml.in/yaml/v4"
)

// TODO: Correct path
const YAML_PATH string = "../configuration.yaml"

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

	return configurations
}
