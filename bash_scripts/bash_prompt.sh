# The various escape codes that we can use to color our prompt.
RED="\[\033[0;31m\]"
YELLOW="\[\033[1;33m\]"
PURPLE="\[\033[1;35m\]"
GREEN="\[\033[0;32m\]"
BLUE="\[\033[1;34m\]"
CYAN="\[\033[1;36m\]"
LIGHT_RED="\[\033[1;31m\]"
LIGHT_GREEN="\[\033[1;32m\]"
WHITE="\[\033[1;37m\]"
LIGHT_GRAY="\[\033[0;37m\]"
COLOR_NONE="\[\e[0m\]"

function is_git_repository {
    git branch > /dev/null 2>&1
}

# Determine the branch/state information for this git repository.
function set_git_branch {
    # Capture the output of the "git status" command.
    git_status="$(git status 2> /dev/null)"

# Set color based on clean/staged/dirty.
if [[ ${git_status} =~ "working tree clean" ]]; then
    state="${GREEN}"
elif [[ ${git_status} =~ "Changes to be committed" ]]; then
    state="${YELLOW}"
else
    state="${LIGHT_RED}"
fi

# Set arrow icon based on status against remote.
remote_pattern="# Your branch is (.*) of"
if [[ ${git_status} =~ ${remote_pattern} ]]; then
    if [[ ${BASH_REMATCH[1]} == "ahead" ]]; then
        remote="↑"
    else
        remote="↓"
    fi
else
    remote=""
fi
diverge_pattern="# Your branch and (.*) have diverged"
if [[ ${git_status} =~ ${diverge_pattern} ]]; then
    remote="↕"
fi

# Get the name of the branch.
gitsym=$(git symbolic-ref HEAD 2>/dev/null)
if [[ $? == 0 ]]; then
    branch="${gitsym##refs/heads/}"
fi

# Set the final branch string.
# BRANCH="${state} (${branch})${remote}${COLOR_NONE} "
BRANCH="${state}(${branch})${remote}${COLOR_NONE} "
}
#
#
# change bash prompt, mac default: "\h:\W \u\$"
#export PS1="\u \w $ "
# Make it green

# Determine active Python virtualenv details.
function set_virtualenv () {
    if test -z "$VIRTUAL_ENV" ; then
        PYTHON_VIRTUALENV=""
    else
        PYTHON_VIRTUALENV="${CYAN}[`basename \"$VIRTUAL_ENV\"`]${COLOR_NONE} "
    fi
}

# Add conda environment to prompt
function set_conda_prompt () {
    if [ ! -z "$CONDA_DEFAULT_ENV" ] && [ "$CONDA_DEFAULT_ENV" != "base" ]; then
        CONDA_PROMPT="(${CONDA_DEFAULT_ENV}) "
    else
        CONDA_PROMPT=""
    fi
}

function set_bash_prompt () {

    set_conda_prompt

    set_virtualenv

    if is_git_repository ; then
        set_git_branch
    else
        BRANCH=''
    fi
    # PS1="\[\e[0;32m\] \u \w ${BRANCH}$ \[\e[m\]"
    PS1="${CONDA_PROMPT}${GREEN}\u ${PYTHON_VIRTUALENV}${BLUE}\w ${BRANCH}${YELLOW}\$${COLOR_NONE} "
}
# export PS1="\[\e[0;32m\] \u \w $ \[\e[m\]"
PROMPT_COMMAND=set_bash_prompt
## Add git branch ##
# Option 1:
# parse_git_branch() {
# git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
# }
# export PS1="\[\e[0;32m\]\u \w\[\e[m\]\$(parse_git_branch) \e[0;32m\]$\[\e[m\] "

# Option 2:
# source ~/.git-prompt.sh
# export PS1='\e[0;32m\]\u \w\e[m\]$(__git_ps1 " (%s)")\e[0;32m\]$\e[m\] '
################
