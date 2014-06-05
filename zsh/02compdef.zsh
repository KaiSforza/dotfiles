#!/bin/zsh
##Initialize completion
#autoload complist
autoload -U compinit;
compinit
#setopt completealiases
# completions for aliases and other things
compdef _pacman pc=pacman
compdef _systemctl sc=systemctl
compdef _systemctl scu=systemctl
compdef _sudo s=sudo
compdef _cower aurctl=cower
compdef _ssh rs-ssh=ssh
compdef _tar bsdtar=tar
compdef _pacman kspman=pacman
compdef _pacman kspmake=makepkg
compdef _ls ll=ls la=ls
compdef _man vman=man
#compdef _ls la=ls

compdef -k _tmux_pane_complete menu-select '^T'
