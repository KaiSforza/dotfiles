#!/usr/bin/bash
#
# Links all of the dotfiles in this repository to the right places.

usage() {
  cat << EOF
usage: $0 <dir with dotfiles>
    Symbolically links files to the appropriate places.
EOF

}

exists-action() {
  local dir file writeover
  dir="$1"
  file="$2"
  printf -- "==> Warning: File .$i already exists in $dir\n"
  printf -- "  -> Overwirte this file? [y/N] "
  read writeover
  case $writeover in
    y|Y)
      mv "$dir/.${file}" "$dotfiles/backups/${file}.backup"
      ln -fsv "$dotfiles/${file}" "$dir/.${file}"
      ;;
    *)
      printf -- "Skipping file ${file}. Manually link this or run it again.\n"
  esac
}

linkdirs() {
  local dir file
  dir="$1"
  file="$2"
  if [[ ! -d "$dir/.${file}" || ! -h "$dir/.${file}" ]]; then
    ln -sv "$dotfiles/${file}" "$dir/.${file}"
  else
    exists-action "$dir" "$file"
  fi
}

linkfiles() {
  local dir file
  dir="$1"
  file="$2"
  if [[ ! -f "$dir/.${file}" || ! -h "$dir/.${file}" ]]; then
    ln -sv "$dotfiles/${file}" "$dir/.${file}"
  else
    exists-action "$dir" "$file"
  fi
}

if [[ ${#@} -ne 1 ]]; then
  usage
  exit 1
fi

homefiles=(bashrc
           gitconfig
           mkshrc
           offlineimaprc
           tmux.conf
           vimrc
           xbindkeysrc
           Xmodmap
           Xresources
           zshrc)
homedirs=(i3
          ncmpcpp
          vim
          zsh)
xdgdirs=(luakit)

dotfiles="$1"

if [[ ! -d $dotfiles ]]; then
  printf -- "No such directory $dotfiles\n"
  exit 1
elif [[ ! -w $HOME || ! -w $XDG_CONFIG_HOME ]]; then
  printf -- "Needed directories are not writable by this user.\n"
  exit 1
fi

for i in ${homefiles[@]}; do
  linkfiles "$HOME" "${i}"
done
for i in ${homedirs[@]}; do
  linkdirs "$HOME" "${i}"
done
for i in ${xdgdirs[@]}; do
  linkdirs "$XDG_CONFIG_HOME" "${i}"
done
