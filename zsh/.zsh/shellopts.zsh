# Customize to your needs...
autoload -U run-help
HELPDIR=/usr/local/share/zsh/helpfiles
autoload -U edit-command-line
fpath=( ~/.zfunc $fpath )
autoload -- ~/.zfunc/[^_]*(:t)
setopt ignore_eof
setopt nobeep
setopt extended_history
setopt append_history
setopt hist_ignore_dups
setopt auto_pushd
setopt pushd_ignore_dups
setopt prompt_subst
setopt braceccl
setopt numeric_glob_sort
unsetopt multios

bindkey -e
zmodload zsh/complist
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
bindkey -M listscroll q send-break
bindkey '\C-i' complete-word
zstyle ':completion:::::' completer _expand _complete _ignored
zstyle ':completion:*:expand:*' tag-order all-expansions
zstyle ':completion:*:expand:*' tag-order 'expansions original'
zle -N edit-command-line
bindkey '\C-w' kill-region
bindkey '\ee' edit-command-line
PS4='+%N:%i:%_>'