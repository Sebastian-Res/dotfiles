package main

type Operation int

const (
	Link Operation = iota
	Copy
	Remove
	Backup
)

func (s Operation) String() string {
	switch s {
	case Link:
		return "Link"
	case Copy:
		return "Copy (WIP)"
	case Remove:
		return "Remove (WIP)"
	case Backup:
		return "Backup (WIP)"
	default:
		return ""
	}
}

type OperationResult struct {
	success bool
	err     string
}
