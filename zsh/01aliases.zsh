#!/bin/zsh
alias -s png=feh
alias -s jpg=feh
alias -s gif=feh
alias -s GIF=feh
alias -s JPG=feh
alias -s PNG=feh
alias -s gz='tar -xzvf'
alias -s bz2='tar -xjvf'
alias -s java=$EDITOR
alias -s txt=$EDITOR
alias -s PKGBUILD=$EDITOR

alias tmx='tmux -S /run/tmux-1000/default '

# Normal aliases
alias ls='ls --color=auto -F'
alias lsd='ls -ld *(-/DN)'
alias lsa='ls -ld .*'
alias ll='ls -F -l'
alias l='ls'
alias lh='ls -l -a -h'
alias la='ls -F -l -a'
alias grep='grep --color=auto'
alias psg='ps aux | grep '
alias f='find |grep'
alias c="clear"
alias dir='ls -1'
alias ..='cd ..'
alias ...='cd ../..'

# command L equivalent to command |less
alias -g L='|less' 

# command S equivalent to command &> /dev/null &
alias -g S='&> /dev/null &'

#package manager aliases:
alias pc="pacman "
alias cw="cower -v "
alias aurctl="cower"
alias cwv="cower -v --target=$HOME/aur/vcs"

#systemd stuff
alias sc="systemctl"
alias scs="systemctl --system"
alias scu="systemctl --user "
alias jc="journalctl "

alias m='mpv'
alias -g reflect="reflector --threads 2 -p http -c 'United States' --sort rate --save /etc/pacman.d/mirrorlist -f5 -a"
alias sudo="sudo "
alias s='sudo '
alias ytv='youtube-viewer -4 --mplayer=mpv'
alias present_term="urxvtc -title 'presenting' -fn 'xft:Bitstream Vera Sans Mono:pixelsize=14' -fb 'xft:Bitstream Vera Sans Mono:pixelsize=14:bold'"
