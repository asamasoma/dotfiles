### Aliases
alias gs='git status'
alias gx='gitx --all'
alias ghist='git log --pretty=format:"%h %ad | %s%d [%an]" --graph --date=short'
alias git-cleanup="git branch --merged | grep -v '^* master$' | grep -v '^  master$' | xargs git branch -d && git remote prune origin"


### Functions

# puts current branch in clipboard
function cpbranch() {
    git rev-parse --abbrev-ref HEAD | tr -d '\n' | pbcopy
}

# puts empty commit message in clipboard, assuming 12345678_feature_branch_title 
# branch name format some engineers like to use. Replace XX with your initials.
function cpmsg() {
    echo [#`git rev-parse --abbrev-ref HEAD | cut -d'_' -f 1`] AA: | tr -d '\n' | pbcopy
}


### Completions

# This assumes Git was installed by Homebrew to /usr/local:
# source /usr/local/etc/bash_completion.d/*
# The above has been deprecated by brew. Use the following line instead:
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

# Speed git tab completion
__git_files () { 
    _wanted files expl 'local files' _files     
}