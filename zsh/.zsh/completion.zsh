zmodload zsh/complist

zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:::::' completer _expand _complete _ignored
zstyle ':completion:*:expand:*' tag-order all-expansions
zstyle ':completion:*:expand:*' tag-order 'expansions original'

# matches case insensitive for lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending