# fixme - the load process here seems a bit bizarre

unsetopt menu_complete   # do not autoselect the first completion entry
unsetopt flowcontrol

setopt auto_menu         # show completion menu on succesive tab press
setopt complete_in_word
setopt always_to_end

#_force_rehash() {
#  (( CURRENT = 1 )) && rehash
#  return 1
#}

zstyle ':completion::complete:*'               use-cache off
#zstyle ':completion:*:complete:'               use-cache off

#zstyle ':completion:*:*:*:*:*' menu select  
zstyle ':completion:*' menu select  
zstyle ':completion:*:*:vim:*:all-files' ignored-patterns '*.class'
zstyle ':completion:*:*:cat:*:all-files' ignored-patterns '*.class'

# Group matches and describe.
zstyle ':completion:*:*:*:*:*'                 menu yes select
zstyle ':completion:*:matches'                 group 'yes'
zstyle ':completion:*:options'                 description 'yes'
zstyle ':completion:*:options'                 auto-description '%d'
zstyle ':completion:*:correct:*'               original true
zstyle ':completion:*:correct:*'               insert-unambiguous true
zstyle ':completion:*:corrections'             format '%B%F{yellow}>> %d (%e error)%f%b'
zstyle ':completion:*:descriptions'            format '%B%F{magenta}>> %d%f%b'
zstyle ':completion:*:messages'                format '%B%F{cyan}>> %d%f%b'
zstyle ':completion:*:warnings'                format '%B%F{red}>> no matches found!%f%b'
zstyle ':completion:*:default'                 list-prompt '%B%S%M matches%s%b'
zstyle ':completion:*'                         format '%B%F{cyan}>> %d%f%b'
zstyle ':completion:*'                         group-name ''
zstyle ':completion:*'                         verbose yes
zstyle ':completion:*'                         special-dirs true

zstyle ':completion:*'                         matcher-list 'm:{a-z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*'                         completer _oldlist _expand _complete _match _approximate #_force_rehash 
zstyle ':completion:*'                         menu select=2
zstyle ':completion:*'                         rehash yes

zstyle ':completion:*:functions'               ignored-patterns '_*'
zstyle ':completion:*:match:*'                 original only
zstyle ':completion:*:approximate:*'           max-errors 1 numeric

zstyle ':completion:*:*:*:users'               ignored-patterns foo
                                                   #bin daemon mail ftp http nobody dbus avahi named git bitlbee mpd \
                                                   #rtkit ntp usbmux gdm

# COMMANDS {{{1
zstyle ':completion:*'                         list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*:*:cd:*'                  tag-order local-directories directory-stack path-directories
zstyle ':completion:*:-tilde-:*'               group-order 'named-directories' 'path-directories' 'users' 'expand'
zstyle ':completion:*'                         squeeze-slashes true

# vim zstyle {{{2
zstyle ':completion:*:*:(vim|gvim):*:*files'   ignored-patterns '*~|*.(old|bak|o|hi)'
zstyle ':completion:*:*:(vim|gvim):*:*files'   file-sort modification
zstyle ':completion:*:*:(vim|gvim):*'          file-sort modification
zstyle ':completion:*:*:(vim|gvim):*'          tag-order files

# kill zstyle {{{2
zstyle ':completion:*:*:kill:*'                command 'ps -e -o pid,%cpu,tty,cputime,cmd'
zstyle ':completion:*:*:kill:*:processes'      list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:*:kill:*'                insert-ids single

# man {{{2
zstyle ':completion:*:manuals'                 separate-sections true
zstyle ':completion:*:manuals.*'               insert-sections true
zstyle ':completion:*:man:*'                   menu yes select

# ssh/scp/rsync {{{2
zstyle ':completion:*:(scp|rsync):*'                  tag-order 'hosts:-host hosts:-domain:domain hosts:-ipaddr:ip\ address *'
zstyle ':completion:*:(scp|rsync):*'                  group-order files all-files hosts-domain hosts-host hosts-ipaddr
zstyle ':completion:*:ssh:*'                          tag-order 'hosts:-host hosts:-domain:domain hosts:-ipaddr:ip\ address *'
zstyle ':completion:*:ssh:*'                          group-order hosts-domain hosts-host users hosts-ipaddr
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-host'   ignored-patterns '*.*' loopback localhost
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-domain' ignored-patterns '<->.<->.<->.<->' '^*.*' '*@*'
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-ipaddr' ignored-patterns '^<->.<->.<->.<->' '127.0.0.<->'
local _hosts
_hosts=()
if [ -f ~/.ssh/config ]; then
  _hosts=(${=${${(M)${(f)"$(<~/.ssh/config)"}:#Host*}#Host }:#*\**})
fi
zstyle ':completion:*' hosts $_hosts

# zathura
zstyle ':completion:*:*:zathura:*:*' file-patterns '(#i)*.{ps,pdf}:files:ps|pdf\ files *(-/):directories:directories'
