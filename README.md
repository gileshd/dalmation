# Dalmation

🐶 A collection of dotfiles for a productive development environment.

## What's Included

- Bash configuration with custom prompt, aliases, and functions
- Vim configuration with plugins for development and writing
- Tmux configuration with sane defaults and productivity features
- Matplotlib styling for data visualization
- iTerm color scheme (ghd-palenight)

## Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/dalmation.git
   cd dalmation
   ```

2. Run the setup script:
   ```bash
   ./setup.sh
   ```
   
   This will:
   - Create symlinks from this repository to your home directory
   - Back up any existing files to a timestamped directory
   - Set up all necessary configurations

3. For the iTerm color scheme:
   - Open iTerm
   - Go to Preferences > Profiles > Colors
   - Click on "Color Presets" dropdown
   - Select "Import" and navigate to the `ghd-palenight.itermcolors` file
   - Select the imported scheme from the "Color Presets" dropdown

## Customization

- Bash configuration:
  - Edit `bash_scripts/bash_aliases.sh` for custom aliases
  - Edit `bash_scripts/bash_functions.sh` for custom functions
  - Edit `bash_scripts/bash_prompt.sh` for prompt customization

- Vim configuration:
  - Edit `.vimrc` for general settings
  - Additional vim config files are sourced from `~/.vim/`

- Tmux configuration:
  - Edit `tmux.conf` for tmux settings

## Requirements

- Bash
- Vim
- Tmux
- Git
- Python (for some functions)
