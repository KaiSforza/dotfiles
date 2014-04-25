#export SUDO_PROMPT="$(print -P '%F{red}[sudo]%f ponyword for %F{green}%n%f@%F{yellow}%m%f: ')"
#[[ -z "$SSH_AUTH_SOCK" ]] && eval $(keychain start loadkeys)

setopt completealiases
setopt printeightbit
setopt braceexpand
setopt braceccl
DISABLE_AUTO_TITLE=true
export EDITOR=vim
export GIT_EDITOR=$EDITOR
export SUDO_EDITOR=$EDITOR
export GPG_TTY=$(tty)
export BROWSER=firefox
export LC_TIME=C
#MPD_HOST=${${"$(ip -4 addr show enp0s25)"#*inet }%%/24*}
#MPD_PORT=
[[ -z $SSH_CONNECTION ]] && DISPLAY=:0
export EDITOR=vim
export VISUAL=vim
export PAGER=less
export LESS="-RM"

# support colors in less
export LESS_TERMCAP_mb=$'\E[01;31m'             # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'        # begin bold
export LESS_TERMCAP_me=$'\E[0m'                 # end mode
export LESS_TERMCAP_se=$'\E[0m'                 # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m'          # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'                 # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m'       # begin underline

# GPG Agent stuffs
if [ -f "${HOME}/.gpg-agent-info" ]; then
  . "${HOME}/.gpg-agent-info"
  export GPG_AGENT_INFO
fi

export PATH="$PATH:$HOME/perl5/bin:$HOME/.rvm/bin/";

export TMUX_TMPDIR="${XDG_RUNTIME_DIR}/tmux"

#export LESS_TERMCAP_mb=$(tput bold; tput setaf 2) # green
#export LESS_TERMCAP_md=$(tput bold; tput setaf 6) # cyan
#export LESS_TERMCAP_me=$(tput sgr0)
#export LESS_TERMCAP_so=$(tput bold; tput setaf 3; tput setab 4) # yellow on blue
#export LESS_TERMCAP_se=$(tput rmso; tput sgr0)
#export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 7) # white
#export LESS_TERMCAP_ue=$(tput rmul; tput sgr0)
#export LESS_TERMCAP_mr=$(tput rev)
#export LESS_TERMCAP_mh=$(tput dim)
#export LESS_TERMCAP_ZN=$(tput ssubm)
#export LESS_TERMCAP_ZV=$(tput rsubm)
#export LESS_TERMCAP_ZO=$(tput ssupm)
#export LESS_TERMCAP_ZW=$(tput rsupm)
