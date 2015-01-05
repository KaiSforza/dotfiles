# Load up the python 3 virtualenv if it exists. If not, try loading the
# python 2 virtualenv. Otherwise we use the __CUSTOM_VENV environment
# variable.
if [[ -n $TMUX ]]; then
    if [[ -n "$__CUSTOM_VENV" && -f "$__CUSTOM_VENV/bin/activate" ]]; then
        . "$__CUSTOM_VENV/bin/activate"
    elif [[ -f $HOME/.virtualenv/3/bin/activate ]]; then
        . $HOME/.virtualenv/3/bin/activate
    elif [[ -f $HOME/.virtualenv/2/bin/activate ]]; then
        . $HOME/.virtualenv/2/bin/activate
    fi
fi
