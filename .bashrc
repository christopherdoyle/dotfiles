#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


# disable completion on empty
shopt -s no_empty_cmd_completion

#### PS1 Setup [see: gentoo bashrc]

# Initial PS1 setup
PS1='\[\033]0;\u@\h:\w\007\]'

# color on colored prompts
use_color=false
if type -P dircolors >/dev/null ; then
  LS_COLORS=
  if [[ -f ~/.dir_colors ]] ; then
    eval "$(dircolors -b ~/.dir_colors)"
  elif [[ -f /etc/DIR_COLORS ]] ; then
    eval "$(dircolors -b /etc/DIR_COLORS)"
  else
    eval "$(dircolors -b)"
  fi
  if [[ -n ${LS_COLORS:+set} ]] ; then
    use_color=true
  else
    # Delete it if it's empty as it's useless in that case.
    unset LS_COLORS
  fi
else
  # Some systems (e.g. BSD & embedded) don't typically come with
  # dircolors so we need to hardcode some terminals in here.
  case ${TERM} in
    [aEkx]term*|rxvt*|gnome*|konsole*|screen|cons25|*color) use_color=true;;
  esac
fi

if ${use_color} ; then
  if [[ ${EUID} == 0 ]] ; then
    PS1+='\[\033[01;31m\]\h\[\033[01;34m\] \W \$\[\033[00m\] '
  else
    PS1+='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] '
  fi

  alias ls='ls --color=auto'
  alias grep='grep --colour=auto'
  alias egrep='egrep --colour=auto'
  alias fgrep='fgrep --colour=auto'
else
  if [[ ${EUID} == 0 ]] ; then
    # show root@ when we don't have colors
    PS1+='\u@\h \W \$ '
  else
    PS1+='\u@\h \w \$ '
  fi
fi



### Aliases and Exports
alias ..='cd ..'
alias df='df -Th'         # types, human-readable
alias free='free -mt'     # megabytes, totals
alias l='ls -F'
alias la='ls -lah'
alias ll='ls -lh'
alias mkdir='mkdir -p'
alias more='less'
alias pacman='sudo pacman --color=auto'
alias psgrep="ps aux | grep -v grep | grep -i -e USER -e"  # glorious
alias rm='rm -i'
alias sudo='sudo '
alias vim=nvim

# fancier aliases if replacements exist
# nb: command -v is more portable than using which
if command -v ncdu >/dev/null 2>&1; then
  alias du='ncdu'
fi
if command -v pydf >/dev/null 2>&1; then
  alias df='pydf'
fi


export PATH=$PATH:~/scripts

if command -v nvim >/dev/null 2>&1; then
  export EDITOR="nvim"
elif command -v vim >/dev/null 2>&1; then
  export EDITOR="vim"
else
  export EDITOR="vi"
fi
export LESS="-erX"
export MANPAGER="less"
export MANWIDTH=80


### Functions

mkcd() {
  mkdir -p $1
  cd $1
}

# xvoland/Extract
function extract {
  if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
  else
    if [ -f $1 ] ; then
      # NAME=${1%.*}
      # mkdir $NAME && cd $NAME
      case $1 in
        *.tar.bz2)   tar xvjf ../$1    ;;
        *.tar.gz)    tar xvzf ../$1    ;;
        *.tar.xz)    tar xvJf ../$1    ;;
        *.lzma)      unlzma ../$1      ;;
        *.bz2)       bunzip2 ../$1     ;;
        *.rar)       unrar x -ad ../$1 ;;
        *.gz)        gunzip ../$1      ;;
        *.tar)       tar xvf ../$1     ;;
        *.tbz2)      tar xvjf ../$1    ;;
        *.tgz)       tar xvzf ../$1    ;;
        *.zip)       unzip ../$1       ;;
        *.Z)         uncompress ../$1  ;;
        *.7z)        7z x ../$1        ;;
        *.xz)        unxz ../$1        ;;
        *.exe)       cabextract ../$1  ;;
        *)           echo "extract: '$1' - unknown archive method" ;;
      esac
    else
      echo "$1 - file does not exist"
    fi
  fi
}

