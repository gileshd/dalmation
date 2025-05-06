#!/bin/bash

# Dalmation - Environment Validation Script
# This script checks if all required dependencies are installed

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}Validating environment for Dalmation dotfiles...${NC}"

# Function to check if a command exists
check_command() {
    local cmd="$1"
    local name="${2:-$cmd}"
    local required="${3:-yes}"
    
    if command -v "$cmd" &> /dev/null; then
        echo -e "${GREEN}✓ $name is installed${NC}"
        return 0
    else
        if [ "$required" = "yes" ]; then
            echo -e "${RED}✗ $name is required but not installed${NC}"
        else
            echo -e "${YELLOW}⚠ $name is recommended but not installed${NC}"
        fi
        return 1
    fi
}

# Check basic requirements
check_command bash "Bash shell"
check_command vim "Vim editor"
check_command tmux "Tmux terminal multiplexer"
check_command git "Git version control"
check_command python3 "Python 3"

# Check for vim-plug (for Vim plugins)
if [ -f ~/.vim/autoload/plug.vim ]; then
    echo -e "${GREEN}✓ vim-plug is installed${NC}"
else
    echo -e "${YELLOW}⚠ vim-plug is not installed. Install it with:${NC}"
    echo -e "  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \\"
    echo -e "  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
fi

# Check for TPM (Tmux Plugin Manager)
if [ -d ~/.tmux/plugins/tpm ]; then
    echo -e "${GREEN}✓ Tmux Plugin Manager is installed${NC}"
else
    echo -e "${YELLOW}⚠ Tmux Plugin Manager is not installed. Install it with:${NC}"
    echo -e "  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm"
fi

# Check optional tools
check_command fzf "fzf fuzzy finder" no
check_command xclip "xclip (for clipboard support on Linux)" no
check_command pbcopy "pbcopy (clipboard support on macOS)" no

# Check OS-specific tools
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS specifics
    check_command gls "GNU ls (brew install coreutils)" no
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux specifics
    # Add any Linux-specific checks here
    :
fi

# Check for Python packages
python_packages=("matplotlib" "numpy")
echo -e "${BLUE}Checking Python packages...${NC}"
for pkg in "${python_packages[@]}"; do
    if python3 -c "import $pkg" &> /dev/null; then
        echo -e "${GREEN}✓ Python package $pkg is installed${NC}"
    else
        echo -e "${YELLOW}⚠ Python package $pkg is recommended but not installed${NC}"
        echo -e "  Install with: pip install $pkg"
    fi
done

echo -e "\n${BLUE}Validation complete!${NC}"