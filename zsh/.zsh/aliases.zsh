## aliases

alias reload='. ~/.zshrc'
alias reload!="exec $SHELL -l"

alias cls='clear'

alias "cd.."="cd ../"
alias up="cd ../"

alias rmrf="rm -rf"
alias psef="ps -ef"

alias mkdir="mkdir -p"

alias cp="cp -r"
alias scp="scp -r"

alias fuck='sudo $(fc -ln -1)'

alias ag="ag --hidden"
alias matrix="cmatrix -b"

alias sprunge="curl -F 'sprunge=<-' http://sprunge.us"
alias clbin="curl -F 'clbin=<-' https://clbin.com"

alias toiletlist='for i in ${TOILET_FONT_PATH:=/usr/share/figlet}/*.{t,f}lf; do j=${i##*/}; echo ""; echo "╓───── "$j; echo "╙────────────────────────────────────── ─ ─ "; echo ""; toilet -d "${i%/*}" -f "$j" "${j%.*}"; done'
alias ascii="toilet -t -f 3d"
alias future="toilet -t -f future"
alias rusto="toilet -t -f rusto"
alias rustofat="toilet -t -f rustofat"
alias lol="base64 </dev/urandom | lolcat"

alias systemctl="sudo systemctl"
alias disks='echo "╓───── m o u n t . p o i n t s"; echo "╙────────────────────────────────────── ─ ─ "; lsblk -a; echo ""; echo "╓───── d i s k . u s a g e"; echo "╙────────────────────────────────────── ─ ─ "; df -h;'

alias lvared="IFS=\$'\n' vared"
alias jps="$JAVA_HOME/bin/jps"

# Pipe my public key to my clipboard.
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"

# Lists the ten most used commands.
alias history-stat="history | awk '{print \$2}' | sort | uniq -c | sort -n -r | head"