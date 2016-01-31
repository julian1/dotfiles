# deployed by ansible!
# http://unix.stackexchange.com/questions/30925/in-bash-when-to-alias-when-to-script-and-when-to-write-a-function
. $HOME/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

export HISTFILESIZE=40000
export HISTSIZE=40001
export HISTTIMEFORMAT="%T " # "
export EDITOR=vim

# locations
export H=$HOME
export A=$HOME/ansible-tests
export C=$HOME/Config_Stuff2
#export L=/var/log

alias a="cd $A"
alias c="cd $C"
alias e='cd /etc'
alias h="cd $HOME"

alias dmesg='dmesg -T --color=always'
alias less='less -R'
alias vim='vim -p'
alias top='top -d .7'

# alias hs="history" # conflict with h=home
alias myip='dig +short myip.opendns.com @resolver1.opendns.com'
alias pong="ping 8.8.8.8 -c 4"
alias pw2='head -c 18 /dev/urandom | base64'
alias pw="head -c 18 /dev/urandom | base64 | sed 's/[\/\+=]//g'"
alias pr='a2ps -1 -R -f 9'
alias t='export T=$(mktemp -d); pushd $T'
alias as='aptitude search'    # conflicts with gnu as
alias au='apt-get update'
alias rec="ffmpeg -f x11grab -s 1920x1080 -r 25 -i :0.0 output.mkv"

alias frdate='TZ=Europe/Paris date'

alias p=ping
alias g=git
# alias ps='ps auxf'
alias v='vim -p'
alias s=sudo
alias sv="sudo vim -p"
alias ss="sudo -s"

alias ls='ls --group-directories-first --color=always'

function la() {
  ls -lh --group-directories-first --color=always $@ | awk -e '{
    k=0;
    for(i=0;i<=8;i++)
      k+=((substr($1,i+2,1)~/[rwx]/)*2^(8-i));
      if(k)
        printf("%0o ",k);
      print
    }'
}

# systemd specific
function start()    { sudo systemctl start $@;   }
function stop()     { sudo systemctl stop $@;    }
function restart()  { sudo systemctl restart $@; }
function status()   { sudo systemctl status $@;  }
function enable()   { sudo systemctl enable $@;  }
function disable()  { sudo systemctl disable $@; }
