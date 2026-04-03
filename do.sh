#!/bin/bash

set -e

function build (
    echo ""
    echo "Building and moving installer..."
    echo ""

    go build -C installer-src/ -o installer

    if [[ -f ./installer ]]; then
        echo "Installer exists, removing old one."
        rm ./installer
    fi

    mv ./installer-src/installer ./installer

    echo "Done."
    echo ""
)

function install (
    if [[ ! -f ./installer ]]; then
        echo "Installer does not exists."
        echo "Run './do.sh build'"
        exit 1
    fi

    ./installer
)

function remove (
    if [[ ! -f ./installer ]]; then
        echo "Installer does not exist. Nothing removed"
    else
        rm ./installer
        echo "Installer removed."
    fi
)

function helpfn (
    echo ""
    echo "/--------------------------------\\"
    echo "|  Do script to build installer  |"
    echo "\\--------------------------------/"
    echo ""
    echo " Available commands are:"
    echo "   install : Starts the installer"
    echo "   remove  : Removes the installer"
    echo "   build   : Builds and moves the installer"
    echo "   help    : Prints this help"
    echo ""
)

# Start

case $1 in
    install)
        install
    ;;
    remove)
        remove
    ;;
    build)
        build
    ;;
    help)
        helpfn
    ;;
    *)
        helpfn
    ;;
esac
