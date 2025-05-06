### venv management ###
# TODO: Add logic to handle .git/exclude ?
venv-create () {
    make_venv () {
        if [ ! -d ./$1/ ]; then
            python3 -m venv "$1"
        else
            echo "Directory $1 already exists!"
            return 1
        fi
    }

    if [ $# -eq 0 ]; then
        VENV_NAME=".venv"
    else
        VENV_NAME=$1
    fi

    make_venv $VENV_NAME

    # check if the VIRUTAL_ENV variable is set, if not, activate the venv.
    if [ -z "$VIRTUAL_ENV" ] && [ $? -eq 0 ]; then
        echo "Activating venv ${VENV_NAME}..."
        venv-activate $VENV_NAME
    fi
}

# TODO: add logic to check for "." prefix.
venv-activate () {
    if [ $# -eq 0 ]; then
        source ./.venv/bin/activate
    else
        source "./$1/bin/activate"
    fi
}

