# Helper functions to switch Java versions

function switchjava() {
    pushd /Library/Java > /dev/null
    sudo rm Home
    sudo ln -s "Home${1}" Home
    popd > /dev/null
}

# Find files and exec commands at them.
# $ find-exec .coffee cat | wc -l
# # => 9762
function find-exec() {
  find . -type f -iname "*${1:-}*" -exec "${2:-file}" '{}' \;
}

# Better find(1)
function ff() {
  find . -iname "*${1:-}*"
}

# Show how much RAM application uses.
# $ ram safari
# # => safari uses 154.69 MBs of RAM.
function ram() {
  local sum
  local items
  local app="$1"
  if [ -z "$app" ]; then
    echo "First argument - pattern to grep from processes"
  else
    sum=0
    for i in `ps aux | grep -i "$app" | grep -v "grep" | awk '{print $6}'`; do
      sum=$(($i + $sum))
    done
    sum=$(echo "scale=2; $sum / 1024.0" | bc)
    if [[ $sum != "0" ]]; then
      echo "${fg[blue]}${app}${reset_color} uses ${fg[green]}${sum}${reset_color} MBs of RAM."
    else
      echo "There are no processes with pattern '${fg[blue]}${app}${reset_color}' are running."
    fi
  fi
}

# $ size dir1 file2.js
function size() {
  # du -sh "$@" 2>&1 | grep -v '^du:' | sort -nr
  du -shck "$@" | sort -rn | awk '
      function human(x) {
          s="kMGTEPYZ";
          while (x>=1000 && length(s)>1)
              {x/=1024; s=substr(s,2)}
          return int(x+0.5) substr(s,1,1)
      }
      {gsub(/^[0-9]+/, human($1)); print}'
}

# $ git log --no-merges --pretty=format:"%ae" | stats
# # => 514 a@example.com
# # => 200 b@example.com
function stats() {
  sort | uniq -c | sort -r
}

# Shortcut for searching commands history.
# hist git
function hist() {
  history 0 | grep $@
}

# $ aes-enc file.zip
function aes-enc() {
  openssl enc -aes-256-cbc -e -in $1 -out "$1.aes"
}

# $ aes-dec file.zip.aes
function aes-dec() {
  openssl enc -aes-256-cbc -d -in $1 -out "${1%.*}"
}

## Media manipulation functions
# Converts a.mkv to a.m4v.
function mkv2mp4() {
  for file in "$@"; do
    ffmpeg -i $file -map 0 -c copy "${file%.*}.m4v"
  done
}

function mkv2mp4_1() {
  for file in "$@"; do
    ffmpeg -i $file -map 0:0 -map 0:1 -c copy -c:s mov_text "${file%.*}.m4v"
  done
}

function mkv2mp4_2() {
  for file in "$@"; do
    ffmpeg -i $file -map 0:0 -map 0:2 -c copy -c:s mov_text "${file%.*}.m4v"
  done
}

function mkv2mp4_3() {
  for file in "$@"; do
    ffmpeg -i $file -map 0:0 -map 0:3 -c copy -c:s mov_text "${file%.*}.m4v"
  done
}

# Adds subs from a.srt to a.m4v.
function addsubs() {
  for file in "$@"; do
    local raw="${file%.*}"
    local old="$raw.m4v"
    local new="$raw-sub.m4v"
    ffmpeg -i $old -i $file -map 0 -map 1 -c copy -c:s mov_text $new
    mv $new $old
    rm $file
  done
}


## Utility functions
# Monitor IO in real-time (open files etc).
function openfiles() {
  sudo dtrace -n 'syscall::open*:entry { printf("%s %s",execname,copyinstr(arg0)); }'
}

# 4 lulz.
function compute() {
  while true; do head -n 100 /dev/urandom; sleep 0.1; done \
    | hexdump -C | grep "ca fe"
}

# $ retry ping google.com
function retry() {
  echo Retrying "$@"
  $@
  sleep 1
  retry $@
}