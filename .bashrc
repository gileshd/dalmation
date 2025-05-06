# Vi mode 
set -o vi

SCRIPT_BASE_PATH="$HOME/dalmation/bash_scripts"

#### Prompt ####
source "$SCRIPT_BASE_PATH/bash_prompt.sh"

#### Alias ####
source "$SCRIPT_BASE_PATH/bash_aliases.sh"
###############

#### Custom Bash Functions ####
source "$SCRIPT_BASE_PATH/bash_functions.sh"
###############################

export PATH=$PATH:$HOME/bin

#### Functions ####
# z #
. /usr/local/share/z/z.sh

# Make fzf include hidden files in search.
export FZF_DEFAULT_COMMAND='find . -type f'
# export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -l -g ""'


# EDITOR 
export EDITOR=vim

# git completion
test -f ~/.git-completion.bash && . $_

