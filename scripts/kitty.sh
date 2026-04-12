#!/bin/bash

# Install script for homebrew
set -euo pipefail

echo "Installing Kitty🐱"
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
