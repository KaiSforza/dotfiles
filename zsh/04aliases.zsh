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

alias tmx='tmux -S /run/user/1000/tmux/default/ '

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
alias ...='cd ../..'
alias cp='cp --reflink=auto'

alias less=$PAGER
alias zless=$PAGER

# command L equivalent to command |less
alias -g L='|less'

# record screen and sound from mic
alias ssrec='ffmpeg -f alsa -i hw:0 -ac 2 -f x11grab -s 1600x900 -r 25 -i :0.0'
# record only screen
alias srec='ffmpeg -f x11grab -s 1600x900 -r 25 -i :0.0'

# command S equivalent to command &> /dev/null &
alias -g S='&> /dev/null &'

#package manager aliases:
alias pc="pacman "
alias yum="dnf"
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

alias rs-ssh='ssh -F ~/.ssh/rs-ssh'

alias ksprpm="fakechroot rpm --root '/home/wgiokas/.local/share/Steam/SteamApps/common/Kerbal Space Program' --dbpath '/var/lib/rpm'"

export _NIX_SHELLS="$HOME/.nixpkgs/shells/"

nix-shell-instantiate () { nix-instantiate "${_NIX_SHELLS}/$1" --indirect --add-root "${_NIX_SHELLS}/${1/.nix/.drv}" }
alias _nix-shell="nix-shell --pure"
alias nix-python3="_nix-shell $_NIX_SHELLS/python/python3.drv"
alias nix-python2="_nix-shell $_NIX_SHELLS/python/python2.drv"
alias nix-python=nix-python3
alias nix-haskell="_nix-shell $_NIX_SHELLS/haskell/haskell.drv"
alias hoogle="_nix-shell $_NIX_SHELLS/haskell/hoogle.drv --command 'hoogle server -d ~/.hoogle/ -p 8080'"
nix-ghc () { nix-haskell --command "ghc ${*}" }
nix-ghci () { nix-haskell --command "ghci ${*}" }
nix-ipython () { nix-python --command "ipython ${*}" }
