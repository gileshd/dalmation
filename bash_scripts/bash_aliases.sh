#!/bin/bash

# Function to detect the operating system
detect_os() {
    if [[ "$OSTYPE" == "darwin"* ]]; then
        echo "macOS"
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        echo "Linux"
    else
        echo "Unknown"
    fi
}

# Function to get the appropriate clipboard command
get_clipboard_command() {
    local operation=$1 # 'copy' or 'paste'
    local os=$(detect_os)

    case $os in
        "macOS")
            if [[ "$operation" == "copy" ]]; then
                echo "pbcopy"
            elif [[ "$operation" == "paste" ]]; then
                echo "pbpaste"
            fi
            ;;
        "Linux")
            if [[ "$operation" == "copy" ]]; then
                echo "xclip -selection clipboard"
            elif [[ "$operation" == "paste" ]]; then
                echo "xclip -selection clipboard -o"
            fi
            ;;
        *)
            echo "echo Unsupported OS for clipboard operations >&2"
            return 1
            ;;
    esac
}

if detect_os | grep -q "macOS"; then
    alias ls='gls --color=auto'
fi

alias ll="ls -lh"
alias cd..="cd .."
# alias chrome="/Applications/Google\\ \\Chrome.app/Contents/MacOS/Google\\ \\Chrome"
# pdfmerge [OUTFILE] [INFILE1] [INFILE2] [...]
alias pdfmerge='merge_pdfs'
#alias gopen="python /Users/ghd/GDrive/API/gopen_dir/open_dir.py"
alias clipclean="$(get_clipboard_command paste) | tr '\r' ' ' | $(get_clipboard_command copy)"
alias cal="gcal --starting-day=1"
alias scratch="vim -c 'call Scratch()'"
