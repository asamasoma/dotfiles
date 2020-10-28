### Aliases
alias gs='git status -sb'
alias gx='gitx --all'
alias ghist='git log --pretty=format:"%h %ad | %s%d [%an]" --graph --date=short'
alias git-cleanup="git branch --merged | grep -v '^* master$' | grep -v '^  master$' | xargs git branch -d && git remote prune origin"
alias gfpush='git push -f origin $(git_current_branch):$(git_current_branch)'

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

# Uses git's autocompletion for inner commands. Assumes an install of git's
# bash `git-completion` script at $completion below (this is where Homebrew
# tosses it, at least).
completion='$(brew --prefix)/share/zsh/site-functions/_git'

if test -f $completion
then
  source $completion
fi

# Speed git tab completion
__git_files () { 
    _wanted files expl 'local files' _files     
}
