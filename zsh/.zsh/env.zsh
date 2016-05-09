# Executable directories
export USR_LOCAL=/usr/local/bin:/usr/local/sbin
export JAVA_HOME=/Library/Java/Home
export MYSQL_PATH=/usr/local/mysql/bin
export DOTFILES=$HOME/.dotfiles

### CONFIGURE PATH
export PATH=$JAVA_HOME/bin:$MYSQL_PATH:$USR_LOCAL:$PATH
# Add go binaries to PATH
export PATH=$PATH:/usr/local/opt/go/libexec/bin
# Add DCOS CLI binary to PATH
if [[ "$PATH" != *"$HOME/dcos/bin"* ]]; then
    export PATH=$PATH:/Users/amasa.amos/dcos/bin;
fi
# Add dotfile scripts to PATH
export PATH=$PATH:$DOTFILES/bin:$DOTFILES/fun/bin

# Keep a longer command history and ignore duplicate entries
export HISTFILESIZE=5000
export HISTCONTROL=ignoredups:erasedups

# Keep the directory stack manageable.
export DIRSTACKSIZE=20

# Set default editor
export EDITOR="emacs"