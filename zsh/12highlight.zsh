if [[ -f "$HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]] ; then
    ## Set up the colors
    . "$HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

    # Add highlighting to options
    ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=cyan'
    ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=cyan'

    # Highlight backtick expansion
    ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=red'

    # make it look like vim, kind of
    ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=red'
    ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=red'
    ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=yellow'

    # Assignment of variables
    ZSH_HIGHLIGHT_STYLES[assign]='fg=red'

    # Blue looks awful on a black terminal most of the time.
    ZSH_HIGHLIGHT_STYLES[globbing]='fg=cyan'
    ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=cyan,underline'
fi
