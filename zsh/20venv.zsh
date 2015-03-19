# Load up the python 3 virtualenv if it exists. If not, try loading the
# python 2 virtualenv. Otherwise we use the __CUSTOM_VENV environment
# variable.
#if [[ -n $TMUX ]]; then
#    if [[ -n "$__CUSTOM_VENV" && -f "$__CUSTOM_VENV/bin/activate" ]]; then
#        . "$__CUSTOM_VENV/bin/activate"
#    elif [[ -f $HOME/.virtualenv/3/bin/activate ]]; then
#        . $HOME/.virtualenv/3/bin/activate
#    elif [[ -f $HOME/.virtualenv/2/bin/activate ]]; then
#        . $HOME/.virtualenv/2/bin/activate
#    fi
#fi

# Also for ocaml
if [[ -f "$HOME/.opam/opam-init/init.zsh" ]]; then
    . "$HOME/.opam/opam-init/init.zsh"
fi

if [[ -d "$HOME/git/pyenv" ]]; then
    export PYENV_ROOT="$HOME/git/pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    . <( "$HOME"/git/pyenv/bin/pyenv init - )
fi

if [[ -d "$HOME/git/pyenv/plugins/pyenv-virtualenv" ]]; then
    . <( "$HOME"/git/pyenv/bin/pyenv virtualenv-init - )
fi
