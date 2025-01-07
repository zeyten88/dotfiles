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
    
    local bar_char="▰"
    local empty_char="▱"
    
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
CORE_PATH="$CONFIG_PATH/lua/core"
PLUGINS_PATH="$CONFIG_PATH/lua/plugins"
CURRENT_DIR=$(pwd)

# Trap function with styled error
trap 'error_msg "Installation failed. Please check the error messages above and try again."; exit 1' ERR

# Create directories with progress indicators
for dir in "$CONFIG_PATH" "$THEMES_PATH" "$CORE_PATH" "$PLUGINS_PATH"; do
    if [ ! -d "$dir" ]; then
        status_msg "Creating directory: $dir"
        mkdir -p "$dir"
        progress 1 20 "Setting up $(basename "$dir") directory"
    fi
done

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

# Copy core files
if [ -d "$CURRENT_DIR/lua/core" ]; then
    cp -rf "$CURRENT_DIR/lua/core/"* "$CORE_PATH/"
    progress 2 20 "Installing core files"
    success_msg "Core files installed successfully"
else
    error_msg "Core directory not found!"
    exit 1
fi

# Copy plugin files
if [ -d "$CURRENT_DIR/lua/plugins" ]; then
    cp -rf "$CURRENT_DIR/lua/plugins/"* "$PLUGINS_PATH/"
    progress 2 20 "Installing plugin files"
    success_msg "Plugin files installed successfully"
else
    error_msg "Plugins directory not found!"
    exit 1
fi

# Copy theme files
if [ -f "$CURRENT_DIR/lua/themes/ztnn.lua" ] && [ -f "$CURRENT_DIR/lua/themes/ztnnstartup.lua" ]; then
    cp -f "$CURRENT_DIR/lua/themes/ztnn.lua" "$THEMES_PATH/"
    cp -f "$CURRENT_DIR/lua/themes/ztnnstartup.lua" "$THEMES_PATH/"
    progress 2 20 "Installing themes"
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

