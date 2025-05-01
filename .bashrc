# Vi mode 
set -o vi

SCRIPT_BASE_PATH="$HOME/GDrive/Me/config/bash_scripts"

#### Prompt ####
source "$SCRIPT_BASE_PATH/bash_prompt.sh"

#### Alias ####
source "$SCRIPT_BASE_PATH/bash_aliases.sh"
###############

# Custom commands
source "$SCRIPT_BASE_PATH/custom_recent_commands.sh"
source "$SCRIPT_BASE_PATH/catpdf.sh"
source "$SCRIPT_BASE_PATH/bash_functions.sh"
export PATH=$PATH:$HOME/bin

#### PATH ####
# added by Miniconda3 installer
# export PATH="/Users/ghd/miniconda3/bin:$PATH"  # commented out by conda initialize  # commented out by conda initialize #commented in by Giles

# add Julia to path
# export PATH="${PATH}:/Applications/Julia-1.1.app/Contents/Resources/julia/bin/"
# Now using a symlink:
# ln -s "/Applications/Julia-1.3.app/Contents/Resources/julia/bin/julia" "/usr/local/bin/julia"

##############

#eval `gdircolors /Users/ghd/Documents/Terminal_Cust/dircolors-solarized/dircolors.256dark`


#### Functions ####
# z #
. /usr/local/share/z/z.sh

### BAT ###
export BAT_THEME="TwoDark"

### HOMEBREW ###
export HOMEBREW_GITHUB_API_TOKEN=ca6d42357ce2dd67051f31fcf937024cd9ec2360
export HOMEBREW_NO_ANALYTICS=1
# Stop stupid fucking homebrew fucking updating and fucking everything up.
export HOMEBREW_NO_AUTO_UPDATE=1 

### MACOS DEFAULT SHELL ###
export BASH_SILENCE_DEPRECATION_WARNING=1


### Use vim as the PAGER ###
#export PAGER="/bin/sh -c \"unset PAGER;col -b -x | \
#    vim -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>' \
#    -c 'map <SPACE> <C-D>' -c 'map b <C-U>' \
#    -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""
############################

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/ghd/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/ghd/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/ghd/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/ghd/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# Make fzf include hidden files in search.
export FZF_DEFAULT_COMMAND='find . -type f'
# export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -l -g ""'

## Tmux copy parent pane conda env
# Taken from:
#	 https://stackoverflow.com/questions/58482113/keeping-the-old-conda-env-activated-upon-splitting-panes-in-tmux
source ~/.tmux_conda.sh

## pyenv stuff - not working for some reason.
# export PYENV_ROOT="$HOME/.pyenv"
# command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"

# pipx
export PIPX_DEFAULT_PYTHON="$HOME/.pyenv/versions/3.12.2/bin/python"
export PATH="$PATH:/Users/ghd/.local/bin"

# EDITOR 
export EDITOR=vim

# git completion
test -f ~/.git-completion.bash && . $_

# McFly
# eval "$(mcfly init bash)"
# export MCFLY_KEY_SCHEME=vim
# export MCFLY_FUZZY=2

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ghd/google-cloud-sdk/path.bash.inc' ]; then . '/Users/ghd/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/ghd/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/ghd/google-cloud-sdk/completion.bash.inc'; fi

# glcoud bucket
export JUG='gs://jug-villian-208'
