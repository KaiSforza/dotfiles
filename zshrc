[[ $- != *i* ]] && return

fpath=($HOME/.zsh/completion $HOME/.zsh/completion/systemd $HOME/.zsh/themes $HOME/.zsh/functions $fpath )
path=($HOME/.cabal/bin $path)

typeset -U fpath path

for f in $HOME/.zsh/*.zsh(on); do
    . "$f"
done
#. ~/.private/zshkeys.zsh
