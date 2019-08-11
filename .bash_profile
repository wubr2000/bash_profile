# Use latest java version
export PATH=/Library/Internet\ Plug-Ins/JavaAppletPlugin.plugin/Contents/Home/bin:$PATH


#!/bin/bash
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

#Terminal color scheme
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

#AWS Keys
export AWS_ACCESS_KEY_ID=ASIAJHJGDTNIJADYONAQ
export AWS_SECRET_ACCESS_KEY=RWnQ4DEV074oKyJ3YyGFdcrPcLESMZJlVQS5zFR7

# colors!
green="\[\033[0;32m\]"
blue="\[\033[0;34m\]"
purple="\[\033[0;35m\]"
reset="\[\033[0m\]"

# Git branch in prompt.

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="$purple\u @ $purple\h $blue\w $green\$(parse_git_branch) $purple$ $reset"


# Some interesting opening info
# http://blog.iharder.net/2011/03/17/bash-profile-sharing-and-useful-scripts/
INTERACTIVETERM=-YES-
if [ "$TERM" == "" ]; then INTERACTIVETERM="-NO-"; TERM="vt100"; fi
if [ "$TERM" == "dumb" ]; then INTERACTIVETERM="-NO-"; TERM="vt100"; fi
export INTERACTIVETERM

# Set up TPUT color codes
if [ "$INTERACTIVETERM" == "-YES-" ]; then
  tReset="$(tput sgr0)"
  tBold="$(tput bold)"
  tBlack="$(tput setaf 0)"
  tRed="$(tput setaf 1)"
  tGreen="$(tput setaf 2)"
  tYellow="$(tput setaf 3)"
  tBlue="$(tput setaf 4)"
  tPink="$(tput setaf 5)"
  tCyan="$(tput setaf 6)"
  tGray="$(tput setaf 7)"
  tWhite="$(tput setaf 8)"
  TUNON="$(tput smul)"
  TUNOFF="$(tput rmul)"
  tRandColor="$(tput setaf $(( $(hostname | openssl sha1 | sed 's/.*\([0-9]\).*/\1/') % 6 + 1 )) )"
else
  tReset=
  tBold=
  tBlack=
  tRed=
  tGreen=
  tYellow=
  tBlue=
  tPink=
  tCyan=
  tGray=
  tWhite=
  tUndOn=
  tUndOff=
  tRandColor=
fi

if [ "$INTERACTIVETERM" == "-YES-" ]; then
  echo "Uptime: " $(uptime | sed "s/up \([0-9a-zA-Z: ]*\),/up ${tBlue}${tBold}\1${tReset},/")
fi


if [ "$INTERACTIVETERM" == "-YES-" ]; then
  cal | gsed "s/\b\($(date +%e | sed 's/^ *//')\)\b/${tBold}${tGreen}\1${tReset}/"
fi

if [ "$INTERACTIVETERM" == "-YES-" ]; then
  curl --max-time 1 -s 'http://download.finance.yahoo.com/d/quotes.csv?s=AAPL&f=l1c1p2'  | awk -F, -v tBold="$tBold" -v tReset="$tReset" -v tColor="$tGreen" '{ printf("AAPL: %s%s\$%s%s, %s∆ \n", tBold,tColor,$1,tReset, $2) }'
  curl --max-time 1 -s 'http://download.finance.yahoo.com/d/quotes.csv?s=TWTR&f=l1c1p2'  | awk -F, -v tBold="$tBold" -v tReset="$tReset" -v tColor="$tGreen" '{ printf("TWTR: %s%s\$%s%s, %s∆ \n", tBold,tColor,$1,tReset, $2) }'
  curl --max-time 1 -s 'http://download.finance.yahoo.com/d/quotes.csv?s=ILMN&f=l1c1p2'  | awk -F, -v tBold="$tBold" -v tReset="$tReset" -v tColor="$tGreen" '{ printf("ILMN: %s%s\$%s%s, %s∆ \n", tBold,tColor,$1,tReset, $2) }'
  curl --max-time 1 -s 'http://download.finance.yahoo.com/d/quotes.csv?s=AMZN&f=l1c1p2'  | awk -F, -v tBold="$tBold" -v tReset="$tReset" -v tColor="$tGreen" '{ printf("AMZN: %s%s\$%s%s, %s∆ \n", tBold,tColor,$1,tReset, $2) }'  
  curl --max-time 1 -s 'http://download.finance.yahoo.com/d/quotes.csv?s=GOOGL&f=l1c1p2'  | awk -F, -v tBold="$tBold" -v tReset="$tReset" -v tColor="$tGreen" '{ printf("GOOGL: %s%s\$%s%s, %s∆ \n", tBold,tColor,$1,tReset, $2) }'  
  curl --max-time 1 -s 'http://download.finance.yahoo.com/d/quotes.csv?s=JW-A&f=l1c1p2'  | awk -F, -v tBold="$tBold" -v tReset="$tReset" -v tColor="$tGreen" '{ printf("JW-A: %s%s\$%s%s, %s∆ \n", tBold,tColor,$1,tReset, $2) }'  
fi



#For AWS-EC2:
# export AWS_ACCESS_KEY_ID=AKIAJZRWJIWTJGS2FF5Q
# export AWS_SECRET_ACCESS_KEY=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

# Navigation
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels

#Aliases
alias l='ls -ahl'
alias c='clear'
alias gaa='git add -A'

alias vi='vim'
alias ipn='jupyter notebook'
alias rstudio='open -a Rstudio.app'
alias chrome='open -a google\ chrome.app'
alias qfind="find . -name "                 # qfind:    Quickly search for file

alias algo='cd ~/Dropbox\ \(Personal\)/Data\ Science\ Courses/Algorithms\ Design/'
alias coding='cd ~/Dropbox\ \(Personal\)/Data\ Science\ Courses/Coding\ Questions/'
alias courses='cd ~/Dropbox\ \(Personal\)/Data\ Science\ Courses/'
alias ds='cd ~/Dropbox\ \(Personal\)/Data\ Science/'
alias algotool='cd ~/Dropbox\ \(Personal\)/Data\ Science\ Courses/Algorithmic\ Toolbox/algorithmic_toolbox'

# added by Anaconda2 4.1.1 installer
export PATH="/Users/bwu/anaconda2/bin:$PATH"
export PATH=~/bin:/Users/bwu/anaconda2/bin:/usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

# Uncomment this to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Try this to prevent accidental overwritting of files, clobbering 
set -o noclobber








# The next line updates PATH for the Google Cloud SDK.
if [ -f /Users/bwu/google-cloud-sdk/path.bash.inc ]; then
  source '/Users/bwu/google-cloud-sdk/path.bash.inc'
fi

# The next line enables shell command completion for gcloud.
if [ -f /Users/bwu/google-cloud-sdk/completion.bash.inc ]; then
  source '/Users/bwu/google-cloud-sdk/completion.bash.inc'
fi
