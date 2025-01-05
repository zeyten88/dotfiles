#!/bin/bash

# Informative messages for the script
echo "Starting the installation process..."
echo "Extracting files from the current directory: $(pwd)"

# Variables for source and destination paths
CONFIG_PATH="$HOME/.config/nvim"
COLORS_PATH="$CONFIG_PATH/colors"
LAZY_PATH="$HOME/.local/share/nvim/lazy/startup.nvim/lua/startup/themes"
CURRENT_DIR=$(pwd)

# Trap function to handle script failure
trap 'echo "Installation failed. Please check the error messages above and try again."; exit 1' ERR

# Ensure ~/.config/nvim exists
if [ ! -d "$CONFIG_PATH" ]; then
    echo "Creating Neovim configuration directory at $CONFIG_PATH..."
    mkdir -p "$CONFIG_PATH"
fi

# Ensure the colors directory exists
if [ ! -d "$COLORS_PATH" ]; then
    echo "Creating 'colors' directory at $COLORS_PATH..."
    mkdir -p "$COLORS_PATH"
fi

# Ensure the lazy startup themes directory exists
if [ ! -d "$LAZY_PATH" ]; then
    echo "Creating lazy.nvim themes directory at $LAZY_PATH..."
    mkdir -p "$LAZY_PATH"
fi

# Copy init.lua to ~/.config/nvim
echo "Copying init.lua to $CONFIG_PATH..."
cp -f "$CURRENT_DIR/init.lua" "$CONFIG_PATH/"

# Copy ztnn.lua to the colors directory
if [ -f "$CURRENT_DIR/colors/ztnn.lua" ]; then
    echo "Copying ztnn.lua to $COLORS_PATH..."
    cp -f "$CURRENT_DIR/colors/ztnn.lua" "$COLORS_PATH/"
else
    echo "Error: ztnn.lua not found in colors directory!"
    exit 1
fi

# Copy ztnnstartup.lua to the lazy themes directory
if [ -f "$CURRENT_DIR/themes/ztnnstartup.lua" ]; then
    echo "Copying ztnnstartup.lua to $LAZY_PATH..."
    cp -f "$CURRENT_DIR/themes/ztnnstartup.lua" "$LAZY_PATH/"
else
    echo "Error: ztnnstartup.lua not found in themes directory!"
    exit 1
fi

# Final success message with ASCII art
echo "                                        ▄▄ "
echo " ███▀▀▀███                  ▀████▀   ▀███▀ ██ "
echo " █▀   ███                     ▀██     ▄█     "
echo " ▀   ███   ▄▄█▀██▀████████▄    ██▄   ▄█  ▀███ ▀████████▄█████▄ "
echo "     ███   ▄█▀   ██ ██    ██     ██▄  █▀    ██   ██    ██    ██ "
echo "     ███   ▄██▀▀▀▀▀▀ ██    ██     ▀██ █▀     ██   ██    ██    ██  "
echo "     ███   ▄███▄    ▄ ██    ██      ▄██▄      ██   ██    ██    ██   "
echo "     █████████ ▀█████▀████  ████▄     ██     ▄████▄████  ████  ████▄ "
echo
echo "Installation successful!"

