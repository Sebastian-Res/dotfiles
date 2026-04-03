package main

type Operation int

const (
	Copy Operation = iota
	Link
	Remove
	Backup
)

func (s Operation) String() string {
	switch s {
	case Copy:
		return "Copy"
	case Link:
		return "Link"
	case Remove:
		return "Remove"
	case Backup:
		return "Backup"
	default:
		return ""
	}
}
