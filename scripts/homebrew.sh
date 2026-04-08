#!/bin/bash

# Install script for homebrew
set -euo pipefail

# Check if Homebrew is already installed
if command -v brew >/dev/null 2>&1; then
  echo "Homebrew is already installed. Skipping."
  exit 0
fi

# Check sudo access
if ! sudo -n true 2>/dev/null; then
  echo "Run this script as sudo."
  exit 1
fi

# Install Homebrew
echo "Installing Homebrew 🍺"
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Adding to config
echo "Adding Homebrew to config"
echo >> ~/.bashrc
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv bash)"' >> ~/.bashrc

echo "Homebrew installed. Source .bashrc"
