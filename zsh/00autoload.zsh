#!/bin/zsh
# Autoload functions
autoload $HOME/.zsh/functions/[^_]*(.:t)

# for moving files with shell patterns
autoload zmv

# lets us use ^X to edit the command line with $EDITOR
autoload -U edit-command-line

autoload -U regex-replace
