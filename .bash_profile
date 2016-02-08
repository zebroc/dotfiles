export PATH="${PATH}:~/bin/"

/usr/bin/ssh-add

export HISTSIZE="100000"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

### General
alias ..="cd .."
alias ...="cd ../../"
alias ....="cd ../../../"
alias .....="cd ../../../../"
alias dir="ls -Gahl"
alias ll="ls -Gahl"
alias l="ls -Gahl"
alias sshkey="cat ~/.ssh/id_rsa.pub|pbcopy && echo 'SSH key copied to clipboard.'"
alias EditHosts="sudo vim /etc/hosts"
#alias EnablePortFWD="echo \"rdr pass inet proto tcp from any to any port 80 -> 192.168.10.10 port 80\" | sudo pfctl -ef -"
#alias DisablePortFWD="sudo pfctl -F all -f /etc/pf.conf"
#alias ShowPortFWD="sudo pfctl -s nat"
alias AndroidScreenshot="cd ~/Downloads/; adb shell screencap -p /sdcard/screen.png; adb pull /sdcard/screen.png; adb shell rm /sdcard/screen.png"

function JsonBeautify() {
  [ $# -ge 1 -a -f "$1" ] && input="$1" || input="-"
  cat $input | python -mjson.tool
}

function Find() {
  find . -iname "${1}"
}

# Directories
alias Desktop="cd ~/Desktop"
alias Documents="cd ~/Documents"
alias Downloads="cd ~/Downloads"

function AwsKey() {
  case "${1}" in
    "a")
      export AWS_ACCESS_KEY_ID=""
      export AWS_SECRET_ACCESS_KEY=""
    ;;
    "b")
      export AWS_ACCESS_KEY_ID=""
      export AWS_SECRET_ACCESS_KEY=""
    ;;
    *)
      echo "$0 ( a | b )"
    ;;
  esac
}

# git
alias gaa="git add --all . && git status"
alias ga="git add && git status"
alias gc="git commit"
alias gp="git push"
alias gs="git status"
alias gcp="git commit && git push"
alias gacp="git add --all . && git commit && git push"
alias gd="git diff"

# Development
source ~/.bash/git-completion.bash

# Prompt
function parse_git_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "("${ref#refs/heads/}") "
}

BLACK="\[\033[0;30m\]"
RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
BLUE="\[\033[0;34m\]"
WHITE="\[\033[0;37m\]"

PROMPT_COMMAND='PS1="$BLUE\u@\h `if [ $? = 0 ]; then echo "\[\e[32m\] ✔ "; else echo "\[\e[31m\] ✘ "; fi` $GREEN\w $YELLOW\$(parse_git_branch)\$$WHITE "'

