#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
FILES_AND_DIRS=(.bashrc .bash_aliases .tmux.conf)
COPY_OR_LINK=""

function copy_file (
	echo "Copying \"$1\" to \"$2\""
	if [[ -L "$2" ]]; then
		rm "$2"
	fi
	cp -rfu "$1" "$2"
)

function link_file (
	echo "Linking \"$1\" to \"$2\""
	ln -sf "$1" "$2"
)

function install_files (
	for entry in "${FILES_AND_DIRS[@]}"; do
		if [[ "$COPY_OR_LINK" == "link" ]]; then
			link_file "${SCRIPT_DIR}/${entry}" "${HOME}/${entry}"
		elif [[ "$COPY_OR_LINK" == "copy" ]]; then
			copy_file "${SCRIPT_DIR}/${entry}" "${HOME}/${entry}"
		else
			echo "Only copy and link work (you should never see this)"
			exit 1
		fi
	done
)

# Start

echo "Dotfile Install Script"
echo ""
echo "Files/Folders will be copied or linked from \"$SCRIPT_DIR/\" to \"$HOME/\""
echo ""
echo ""

read -p "Copy files or create symbolic links (c/S): " symlink
symlink=${symlink:-S}

# Setting copy or link
if [[ "$symlink" =~ ^[sS]$ ]]; then
	COPY_OR_LINK="link"
elif [[ "$symlink" =~ ^[cC]$ ]]; then
	COPY_OR_LINK="copy"
else
	echo "Only (c)opy and (s)ymbolic link are valid inputs" && exit 1
fi

install_files
