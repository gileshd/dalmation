# Just execute the .bashrc
if [ -f ~/.bashrc ]; then
	source ~/.bashrc
fi

eval "$(/opt/homebrew/bin/brew shellenv)"
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# pipx
export PATH="$PATH:/Users/ghd/.local/bin"
