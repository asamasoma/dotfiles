# Executable directories
export USR_LOCAL=/usr/local/bin:/usr/local/sbin
export MYSQL_PATH=/usr/local/mysql/bin
export DOTFILES=$HOME/.dotfiles

### CONFIGURE PATH
export PATH=$JAVA_HOME/bin:$MYSQL_PATH:$USR_LOCAL:$PATH
# Add go binaries to PATH
export PATH=$PATH:/usr/local/opt/go/libexec/bin
# Add dotfile scripts to PATH
export PATH=$PATH:$DOTFILES/bin:$DOTFILES/fun/bin
