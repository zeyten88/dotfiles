#!/bin/bash

# Colors and formatting
GREEN='\033[0;32m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color
BOLD='\033[1m'

# Progress animation function
progress() {
    local duration=$1
    local width=$2
    local message=$3
    
    # Progress bar characters
    local bar_char="▰"
    local empty_char="▱"
    
    # Create progress bar
    local fill
    local empty
    local progress
    
    echo -n -e "\r${CYAN}${message}${NC} "
    
    for ((i = 0; i <= ${width}; i++)); do
        fill=$(printf "%${i}s" "" | tr ' ' "${bar_char}")
        empty=$(printf "%$((width - i))s" "" | tr ' ' "${empty_char}")
        progress=$(((i * 100) / width))
        
        echo -n -e "\r${CYAN}${message}${NC} ${BLUE}[${fill}${empty}] ${progress}%${NC}"
        sleep "$((duration / width))"
    done
    echo
}

# Fancy header
print_header() {
    clear
    echo -e "${CYAN}"
    echo "╔══════════════════════════════════════════════════════════════╗"
    echo "║                    ZenVim Installation                        ║"
    echo "╚══════════════════════════════════════════════════════════════╝"
    echo -e "${NC}"
}

# Fancy status messages
status_msg() {
    echo -e "${YELLOW}[INFO]${NC} $1"
}

success_msg() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

error_msg() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Print header
print_header

# Variables for paths
CONFIG_PATH="$HOME/.config/nvim"
THEMES_PATH="$CONFIG_PATH/lua/themes"
CURRENT_DIR=$(pwd)

# Trap function with styled error
trap 'error_msg "Installation failed. Please check the error messages above and try again."; exit 1' ERR

# Create directories with progress indicators
if [ ! -d "$CONFIG_PATH" ]; then
    status_msg "Creating Neovim configuration directory..."
    mkdir -p "$CONFIG_PATH"
    progress 1 20 "Setting up config directory"
fi

if [ ! -d "$THEMES_PATH" ]; then
    status_msg "Creating themes directory..."
    mkdir -p "$THEMES_PATH"
    progress 1 20 "Setting up themes directory"
fi

# Copy files with progress
status_msg "Copying configuration files..."

# Copy init.lua
if cp -f "$CURRENT_DIR/init.lua" "$CONFIG_PATH/"; then
    progress 2 20 "Installing init.lua"
    success_msg "init.lua installed successfully"
else
    error_msg "Failed to copy init.lua"
    exit 1
fi

# Copy theme files
if [ -f "$CURRENT_DIR/lua/themes/ztnn.lua" ] && [ -f "$CURRENT_DIR/lua/themes/ztnnstartup.lua" ]; then
    cp -f "$CURRENT_DIR/lua/themes/ztnn.lua" "$THEMES_PATH/"
    cp -f "$CURRENT_DIR/lua/themes/ztnnstartup.lua" "$THEMES_PATH/"
    progress 2 20 "Installing startup theme"
    success_msg "Themes installed successfully"
else
    error_msg "Theme files not found in lua/themes directory!"
    exit 1
fi

# Final success message with styled ASCII art
echo
echo -e "${GREEN}"
echo "                                        ▄▄ "
echo " ███▀▀▀███                  ▀████▀   ▀███▀ ██ "
echo " █▀   ███                     ▀██     ▄█     "
echo " ▀   ███   ▄▄█▀██▀████████▄    ██▄   ▄█  ▀███ ▀████████▄█████▄ "
echo "    ███   ▄█▀   ██ ██    ██     ██▄  █▀    ██   ██    ██    ██ "
echo "   ███   ▄██▀▀▀▀▀▀ ██    ██     ▀██ █▀     ██   ██    ██    ██  "
echo "  ███   ▄███▄    ▄ ██    ██      ▄██▄      ██   ██    ██    ██   "
echo " █████████ ▀█████▀████  ████▄     ██     ▄████▄████  ████  ████▄ "
echo -e "${NC}"
echo
echo -e "${GREEN}${BOLD}Installation completed successfully!${NC}"
echo -e "${CYAN}Start nvim to experience your new setup!${NC}"
echo

