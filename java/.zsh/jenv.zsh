### Use homebrew's directories rather than ~/.jenv
export JENV_ROOT=/usr/local/var/jenv

### Enable shims and autocompletion for jenv
if which jenv > /dev/null; then eval "$(jenv init -)"; fi