#!/bin/bash

# Dalmation - Dotfiles Setup Script
# This script creates symlinks from the dotfiles in this repository to the user's home directory.

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Get the directory where this script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Create backup directory
BACKUP_DIR="$HOME/.dotfiles_backup_$(date +%Y%m%d_%H%M%S)"
mkdir -p "$BACKUP_DIR"
echo -e "${BLUE}Created backup directory at $BACKUP_DIR${NC}"

# Function to backup and create symlink
backup_and_link() {
    local source_file="$1"
    local target_file="$2"
    
    # Create target directory if it doesn't exist
    local target_dir=$(dirname "$target_file")
    if [ ! -d "$target_dir" ]; then
        mkdir -p "$target_dir"
        echo -e "${GREEN}Created directory $target_dir${NC}"
    fi
    
    # Backup existing file/directory if it exists
    if [ -e "$target_file" ]; then
        if [ -L "$target_file" ]; then
            # It's a symlink, just remove it
            rm "$target_file"
            echo -e "${YELLOW}Removed existing symlink $target_file${NC}"
        else
            # It's a file or directory, back it up
            mv "$target_file" "$BACKUP_DIR/"
            echo -e "${YELLOW}Backed up $target_file to $BACKUP_DIR/${NC}"
        fi
    fi
    
    # Create the symlink
    ln -s "$source_file" "$target_file"
    echo -e "${GREEN}Created symlink: $target_file -> $source_file${NC}"
}

# Main setup function
setup() {
    echo -e "${BLUE}Setting up symlinks for dotfiles...${NC}"
    
    # Bash files
    backup_and_link "$SCRIPT_DIR/.bashrc" "$HOME/.bashrc"
    backup_and_link "$SCRIPT_DIR/bash_scripts" "$HOME/bash_scripts"
    
    # Vim files
    backup_and_link "$SCRIPT_DIR/.vimrc" "$HOME/.vimrc"
    
    # Tmux files
    backup_and_link "$SCRIPT_DIR/tmux.conf" "$HOME/.tmux.conf"
    
    # Matplotlib configuration
    backup_and_link "$SCRIPT_DIR/matplotlib" "$HOME/.config/matplotlib"
    
    # iTerm color scheme
    echo -e "${YELLOW}Note: The iTerm color scheme (ghd-palenight.itermcolors) should be imported manually in iTerm preferences.${NC}"
    
    echo -e "${GREEN}Dotfiles setup complete!${NC}"
    echo -e "${YELLOW}Your original files were backed up to $BACKUP_DIR${NC}"
    echo -e "${BLUE}You may need to restart your terminal or run 'source ~/.bashrc' for changes to take effect.${NC}"
}

# Execute the setup function
setup