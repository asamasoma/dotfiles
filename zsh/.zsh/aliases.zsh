## Useful aliases
alias lvared="IFS=\$'\n' vared"
alias jps="$JAVA_HOME/bin/jps"

# Pipe my public key to my clipboard.
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"

# Lists the ten most used commands.
alias history-stat="history | awk '{print \$2}' | sort | uniq -c | sort -n -r | head"