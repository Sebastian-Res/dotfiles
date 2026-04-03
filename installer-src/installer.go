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

type Instructions struct {
	Operation    Operation
	ConfigNames  []string
	Confirmation bool
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
	var configname_options []huh.Option[string]
	startUp := func() {
		time.Sleep(500 * time.Millisecond)
		available_configs = ReadConfigurationFile().Configs
		for _, config := range available_configs {
			configname_options = append(configname_options, huh.NewOption(config.Name, config.Name).Selected(true))
		}
	}

	_ = spinner.New().Title("Reading config file...").Action(startUp).Run()

	instructions := Instructions{}

	form := huh.NewForm(
		huh.NewGroup(
			huh.NewSelect[Operation]().
				Title("What to do?").
				Options(
					huh.NewOption("Copy", Copy).Selected(true),
					huh.NewOption("Link", Link),
					huh.NewOption("Backup", Backup),
					huh.NewOption("Remove", Remove),
				).
				Value(&instructions.Operation),
		),

		huh.NewGroup(
			huh.NewMultiSelect[string]().
				// Remove when it does not take a space from the options
				// Title("Configs").
				Options(configname_options...).
				Validate(func(t []string) error {
					if len(t) <= 0 {
						return fmt.Errorf("at least one config is required")
					}
					return nil
				}).
				Value(&instructions.ConfigNames).
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
	}

	_ = spinner.New().Title("Working...").Action(installing).Run()

	// Print order summary.
	{
		var sb strings.Builder
		keyword := func(s string) string {
			return lipgloss.NewStyle().Foreground(lipgloss.Color("212")).Render(s)
		}
		fmt.Fprintf(&sb,
			"%s\n\nType: %s\nConfigs: %s",
			lipgloss.NewStyle().Bold(true).Render("SUMMARY"),
			keyword(instructions.Operation.String()),
			keyword(xstrings.EnglishJoin(instructions.ConfigNames, true)),
		)

		fmt.Println(
			lipgloss.NewStyle().
				Width(40).
				BorderStyle(lipgloss.RoundedBorder()).
				BorderForeground(lipgloss.Color("63")).
				Padding(1, 2).
				Render(sb.String()),
		)
	}
}
