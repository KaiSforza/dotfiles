export SUDO_PROMPT="$(print -P '%B%F{red}[sudo]%f%b password for %B%F{blue}%n%f%b@%F{green}%m%f: ')"

if [[ -z "${XDG_RUNTIME_DIR}" ]]; then
    export RUNTIMEDIR=/tmp/$UID
    install -dm700 "$RUNTIMEDIR"
else
    export RUNTIMEDIR="$XDG_RUNTIME_DIR"
fi

if [[ ! -f "$RUNTIMEDIR"/ssh/agent ]] ; then
    install -dm700 "$RUNTIMEDIR"/ssh
    ssh-agent > "$RUNTIMEDIR"/ssh/agent
fi

. "$RUNTIMEDIR"/ssh/agent >/dev/null

setopt completealiases
setopt printeightbit
setopt braceexpand
setopt braceccl
setopt AUTO_PUSHD
DISABLE_AUTO_TITLE=true
if [[ -x /usr/bin/vimx ]]; then
    export EDITOR=vimx
    alias vim=vimx
else
    export EDITOR=vim
fi
export GIT_EDITOR=$EDITOR
export SUDO_EDITOR=$EDITOR
export GPG_TTY=$(tty)
export BROWSER=firefox
export LC_TIME=C
#MPD_HOST=${${"$(ip -4 addr show enp0s25)"#*inet }%%/24*}
#MPD_PORT=
#[[ -z $SSH_CONNECTION ]] && DISPLAY=:0
export VISUAL="$EDITOR"
export PAGER=less
export LESS="-RM"

## Uncomment to use a custom virtualenv.
#export __CUSTOM_VENV="$HOME/.virtualenv/3/"

## Custom list of virtual environments that are not in a specific directory.
## This is an associative array, where the name you want the venv to to by
## is the key. Example:
##   (3 $HOME/.venv/3
##    2 foo/bar/baz/2
##    django $HOME/dev/django)
#typeset -A __CUSTOM_VENV_LIST
#__CUSTOM_VENV_LIST=()
#export __CUSTOM_VENV_LIST

## Custom virtual environment directory that is not ~/.virtualenv
#export __CUSTOM_VENV_DIR

if [[ "$TERM" == "xterm" ]]; then
    export TERM=xterm-256color
fi

# GPG Agent stuffs
if [[ -f "${HOME}/.gpg-agent-info" ]]; then
  . "${HOME}/.gpg-agent-info"
  export GPG_AGENT_INFO
fi

# Dircolors. Makes 'ls' look purdy.
if [[ -a $HOME/.dir_colors ]]; then
  eval $(dircolors $HOME/.dir_colors)
fi

# Path manipulations. Only add these if they exist to keep $PATH clean.
if [[ -d "$HOME/bin/perl5" ]]; then
  export PATH="$HOME/bin/perl5:$PATH"
fi
if [[ -d "$HOME/.rvm/bin" ]]; then
  export PATH="$HOME/.rvm/bin:$PATH"
  source "$HOME/.rvm/scripts/rvm"
  for i in "$HOME"/.rvm/gems/*/bin ; do
    export PATH="$i:$PATH"
  done
fi
if [[ -d "$HOME/git/homebrew/bin" ]]; then
  export PATH="$HOME/git/homebrew/bin:$PATH"
fi
if [[ -d "$HOME/bin" ]]; then
  export PATH="$HOME/bin:$PATH"
fi

export PATH="$PATH:/usr/sbin:/sbin"

if [[ -n "${XDG_RUNTIME_DIR}" ]]; then
    export TMUX_TMPDIR="${XDG_RUNTIME_DIR}/tmux"
fi

## support colors in less
export LESS_TERMCAP_mb=$(tput bold; tput setaf 2) # begin blinking | green
export LESS_TERMCAP_md=$(tput bold; tput setaf 6) # begin bold | cyan
export LESS_TERMCAP_me=$(tput sgr0)               # end mode
export LESS_TERMCAP_so=$(tput bold; tput setaf 3; tput setab 4) # begin standout-mode | yellow on blue
export LESS_TERMCAP_se=$(tput rmso; tput sgr0)    # end standout mode
export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 7) # begin underline | white
export LESS_TERMCAP_ue=$(tput rmul; tput sgr0)
export LESS_TERMCAP_mr=$(tput rev)
export LESS_TERMCAP_mh=$(tput dim)
export LESS_TERMCAP_ZN=$(tput ssubm)
export LESS_TERMCAP_ZV=$(tput rsubm)
export LESS_TERMCAP_ZO=$(tput ssupm)
export LESS_TERMCAP_ZW=$(tput rsupm)

if [[ -e "$HOME/.nix-profile/etc/profile.d/nix.sh" ]]; then
    . "$HOME/.nix-profile/etc/profile.d/nix.sh"
    export NIX_PATH=nixpkgs=/nix/nixpkgs:nixpkgs=/nix/nixpkgs
fi
