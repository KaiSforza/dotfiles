[[ $- != *i* ]] && return
#if [[ $TERM != "screen-256color" && $TTY != /dev/tty* ]];then tmux a || tmux -2 -l -q && exit; fi

fpath=($HOME/.zsh/completion $HOME/.zsh/themes $HOME/.zsh/functions $fpath )
path=($HOME/.cabal/bin $path)

autoload $HOME/.zsh/functions/[^_]*(.:t)
autoload -U promptinit && promptinit
prompt kaictl2
for f in $HOME/.zsh/*.zsh(on); do
    . $f
done
#. ~/.private/zshkeys.zsh

alias less=$PAGER
alias zless=$PAGER
autoload zmv

autoload -U edit-command-line
zle -N edit-command-line

eval "$(sed -nE 's/^([^#]+): /bindkey \1 /' /etc/inputrc)"

#autoload complist
autoload -U compinit;
compinit

#[[ -n ${(f)$(alias run-help)} ]] && unalias run-help
autoload -U regex-replace

src()
{
  autoload -U zrecompile
  [ -f ~/.zshrc ] && zrecompile -p ~/.zshrc
  [ -f ~/.zcompdump ] && zrecompile -p ~/.zcompdump
  [ -f ~/.zcompdump ] && zrecompile -p ~/.zcompdump
  [ -f ~/.zshrc.zwc.old ] && rm -f ~/.zshrc.zwc.old
  [ -f ~/.zcompdump.zwc.old ] && rm -f ~/.zcompdump.zwc.old
  source ~/.zshrc
}

t(){
	tmux -L main "${@:-attach}";}
# vi: ft=zsh sw=2 ts=2
_tmux_pane_complete() {
  [[ -z "$TMUX_PANE" ]] && return 1
  local -a -U words
  words=(${=$(tmux capture-pane -S -1853 \; show-buffer \; delete-buffer)})
  compadd -a words
}

compdef -k _tmux_pane_complete menu-select '^T'


typeset -U fpath path

if [[ $TERM == xterm-termite ]]; then
  . /etc/profile.d/vte.sh

  __vte_ps1

  chpwd() {
    __vte_ps1
  }
fi

if [ -f "${HOME}/.gpg-agent-info" ]; then
	. "${HOME}/.gpg-agent-info"
	export GPG_AGENT_INFO
fi

#setopt completealiases
compdef _pacman pc=pacman
compdef _systemd sc=systemctl
compdef _systemd scu=systemctl
compdef _sudo s=sudo
compdef _systemd journalctl=journalctl
compdef _cower aurctl=cower

#export PERL_LOCAL_LIB_ROOT="$PERL_LOCAL_LIB_ROOT:/home/wgiokas/perl5";
#export PERL_MB_OPT="--install_base /home/wgiokas/perl5";
#export PERL_MM_OPT="INSTALL_BASE=/home/wgiokas/perl5";
#export PERL5LIB="/home/wgiokas/perl5/lib/perl5:$PERL5LIB";
export PATH="/home/wgiokas/perl5/bin:$PATH";
