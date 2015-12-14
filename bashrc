# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export EDITOR=vim

#export PATH=$PATH:/home/meteo/play-2.1.1/ 
# export JAVA_HOME=/usr/lib/jvm/java-6-openjdk-amd64
#export GRAILS_HOME=/home/meteo/grails-2.2.2/ 
# 
# export JAVA_HOME=/home/meteo/java/jdk1.7.0_21/
# # export JAVA_HOME=/home/meteo/java/jdk1.8.0_45/
# export PATH="$PATH:$JAVA_HOME/bin"
# 
# # portal
# export GRAILS_HOME=/home/meteo/imos/software/grails-1.3.7/ 
# export PATH="$PATH:$GRAILS_HOME/bin"
# 
# 
#export GRAILS_HOME=/home/meteo/imos/software/grails-2.1.0/ 
#export PATH="$PATH:$GRAILS_HOME/bin"
# 

# <<<<<<< HEAD
# =======
# export GRAILS_HOME=/home/meteo/java/grails-2.4.4/
# export PATH="$PATH:$GRAILS_HOME/bin"
# >>>>>>> 9472508641a01b1d7b065fa5e1ca008795bd10cf

# 
# # vocab
# export GRAILS_HOME=/home/meteo/imos/software/grails-2.4.4/
# export PATH="$PATH:$GRAILS_HOME/bin"
# 


#export GROOVY_HOME=/home/meteo/imos/software/groovy-2.1.3/ 
#export PATH="$PATH:$GROOVY_HOME/bin"

export MAVEN_HOME=/home/meteo/imos/software/apache-maven-3.2.2/
export PATH="$PATH:$MAVEN_HOME/bin"



# locations
D=/home/meteo/imos

# export HISTTIMEFORMAT="%d/%m/%y %T "
export HISTTIMEFORMAT="%T "

## file locations alias
alias i="cd $I"

## vagrant shortcuts

## ssh alias

# alias 134='ssh -A 144.6.224.134'
#alias 2t='ssh -A jfca@144.6.224.135'

# cd into a temp directory
alias t='pushd $( mktemp -d )'

# git
alias g='git'

# should be using aliases in .gitconfig


[ -f /home/meteo/paths ] && source /home/meteo/paths

