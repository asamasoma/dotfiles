# Customize to your needs...

# Keep a longer command history and ignore duplicate entries
HISTFILESIZE=5000
HISTCONTROL=ignoredups:erasedups

# Keep the directory stack manageable.
DIRSTACKSIZE=20

# Set default editor
EDITOR="vim"

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
bindkey -M listscroll q send-break
bindkey '\C-i' complete-word
zle -N edit-command-line
bindkey '\C-w' kill-region
bindkey '\ee' edit-command-line
PS4='+%N:%i:%_>'
