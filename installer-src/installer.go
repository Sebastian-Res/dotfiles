package main

import (
	"fmt"
	"os"
	"strings"
	"time"

	"charm.land/bubbles/v2/key"
	"charm.land/huh/v2"
	"charm.land/huh/v2/spinner"
	"charm.land/lipgloss/v2"
	xstrings "github.com/charmbracelet/x/exp/strings"
)

// Maybe use https://github.com/jroimartin/gocui in the future

type Instructions struct {
	Operation    Operation
	Configs      []*Config
	Confirmation bool
	Results      []OperationResult
}

func CustomKeyMap() *huh.KeyMap {
	keymap := huh.NewDefaultKeyMap()

	keymap.Quit = key.NewBinding(key.WithKeys("ctrl+c", "q"), key.WithHelp("q", "Quit"))

	return keymap
}

// Workaround as in https://github.com/charmbracelet/huh/issues/745
type CustomTheme struct{}

func (t *CustomTheme) Theme(isDark bool) *huh.Styles {
	return huh.ThemeDracula(isDark)
}

func main() {
	customTheme := new(CustomTheme)

	var available_configs []Config
	var configname_options []huh.Option[*Config]
	startUp := func() {
		time.Sleep(500 * time.Millisecond)
		available_configs = ReadConfigurationFile().Configs
		for _, config := range available_configs {
			configname_options = append(configname_options, huh.NewOption(config.Name, &config).Selected(true))
		}
	}

	_ = spinner.New().Title("Reading config file...").Action(startUp).Run()

	instructions := Instructions{}

	form := huh.NewForm(
		huh.NewGroup(
			huh.NewSelect[Operation]().
				Title("What to do?").
				Options(
					huh.NewOption(Link.String(), Link).Selected(true),
					huh.NewOption(Copy.String(), Copy),
					huh.NewOption(Backup.String(), Backup),
					huh.NewOption(Remove.String(), Remove),
				).
				Value(&instructions.Operation),
		),

		huh.NewGroup(
			huh.NewMultiSelect[*Config]().
				// Remove when it does not take a space from the options
				// Title("Configs").
				Options(configname_options...).
				Validate(func(t []*Config) error {
					if len(t) <= 0 {
						return fmt.Errorf("at least one config is required")
					}
					return nil
				}).
				Value(&instructions.Configs).
				Filterable(true),
		),

		// Confirm changes
		huh.NewGroup(
			huh.NewConfirm().
				Title("Confirm changes to your system?").
				Value(&instructions.Confirmation).
				Affirmative("Yes").
				Negative("No"),
		),
	).WithKeyMap(CustomKeyMap()).WithTheme(customTheme)

	err := form.Run()
	if err != nil {
		if err.Error() == "user aborted" {
			fmt.Println("Cancel by User")
			os.Exit(0)
		} else {
			fmt.Println("Error:", err)
			os.Exit(1)
		}
	}

	if !instructions.Confirmation {
		fmt.Println("Cancel by User")
		os.Exit(0)
	}

	installing := func() {
		time.Sleep(500 * time.Millisecond)

		for _, config_pointer := range instructions.Configs {
			var result OperationResult

			for _, files := range config_pointer.Files {
				var res OperationResult

				switch instructions.Operation {
				case Link:
					res = LinkFile(files.Src_path, files.Target_folder)
				case Copy:
					fmt.Println("Copy not supported yet")
					os.Exit(1)
				case Remove:
					fmt.Println("Removed not supported yet")
					os.Exit(1)
				case Backup:
					fmt.Println("Backup not supported yet")
					os.Exit(1)
				}

				result = res

				if !res.success {
					break
				}
			}
			instructions.Results = append(instructions.Results, result)
		}
	}

	_ = spinner.New().Title("Working...").Action(installing).Run()

	// Print operation summary.
	{
		keyword := func(s string) string {
			return lipgloss.NewStyle().Foreground(lipgloss.BrightMagenta).Render(s)
		}

		success_config := func(s string) string {
			return lipgloss.NewStyle().Foreground(lipgloss.Green).Render(s)
		}

		failed_config := func(s string) string {
			return lipgloss.NewStyle().Foreground(lipgloss.Red).Render(s)
		}

		var sb strings.Builder
		fmt.Fprintf(&sb,
			"%s\n\nType: %s\nConfigs: ",
			lipgloss.NewStyle().Bold(true).Render("SUMMARY"),
			keyword(instructions.Operation.String()),
		)

		// Array of config names
		var names []string
		for _, config := range instructions.Configs {
			names = append(names, config.Name)
		}
		sb.WriteString(keyword(xstrings.EnglishJoin(names, true)) + "\n")

		for index, config := range instructions.Configs {
			if instructions.Results[index].success {
				sb.WriteString(success_config("✓ " + config.Name))
			} else {
				sb.WriteString(failed_config("✗ "+config.Name) + ": " + instructions.Results[index].err)
			}
			sb.WriteString("\n")
		}

		fmt.Println(
			lipgloss.NewStyle().
				BorderStyle(lipgloss.RoundedBorder()).
				BorderForeground(lipgloss.Color("63")).
				Padding(1, 2).
				Render(sb.String()),
		)
	}
}
