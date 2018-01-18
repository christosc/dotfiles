shopt -s globstar
shopt -s histverify
shopt -s nocaseglob


if [ -f $(brew --prefix)/etc/bash_completion ]; then
  source $(brew --prefix)/etc/bash_completion
fi


source $(brew --prefix)/etc/bash_completion.d/git-prompt.sh

#if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
#  __GIT_PROMPT_DIR=$(brew --prefix)/opt/bash-git-prompt/share
#  source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
#fi

export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUPSTREAM="auto"
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWCOLORHINTS=1
GIT_PS1_SHOWUPSTREAM='auto'
export GIT_PS1_SHOWCOLORHINTS=true
export PS1="\u@\h:\W\[\e[96m\]\$(__git_ps1 \" (%s) \")\[\e[0m\]> "
#export PS1="[\u@\h:\W]\$(__git_ps1 \" (%s) \")"
#export PS1="$PS1""(eth: \$(eth enabled | tr [:upper:] [:lower:])) \$ "
#export PS1="[\u@\h:\w ]\$(__git_ps1 \" (%s) \") $ "
#export PS1="\u@\h:\W \$(__git_ps1 \" (%s)\") "
#export PS1="\s-\v\ \$(__git_ps1 \" (%s)\") "

alias -- -="fg %-"
alias -- +="fg %+"
alias 1="fg %1"
alias 2="fg %2"
alias 3="fg %3"
alias 4="fg %4"
alias 5="fg %5"
alias 6="fg %6"
alias 7="fg %7"
alias 8="fg %8"
alias 9="fg %9"
alias j="jobs"
alias h="history"
alias rm='rm -i'
alias g='grep --color'
alias f='find . -iname '
alias loc='sudo networksetup -switchtolocation'
alias grep='grep --color'
alias egrep='egrep --color'
alias fgrep='fgrep --color'

#alias grep='grep --color=always'
#alias less='less -ri'
export LESS='-ri'

function mypushd {
    pushd "${@}" >/dev/null;
    dirs -v;
}

function mypopd {
    popd "${@}" >/dev/null;
    dirs -v;
}

alias d='dirs -v'
#alias p='mypushd'
alias p='pushd'
#alias o='mypopd'
alias o='popd'
#alias ctags-objc="ctags --languages=objectivec,Swift --langmap=objectivec:.h.m"

export CDPATH=.:"$HOME"/work:"$HOME/Documents/Projects"

#function eth() {
#    networkService='Apple USB Ethernet Adapter'
#
#    if [ "$#" -ne 1 ]; then
#        networksetup -getnetworkserviceenabled  "$networkService"
#    elif [ $1 -eq 0 ]; then  # disconnect
#        networksetup -setnetworkserviceenabled  "$networkService" off
#    elif [ $1 -eq 1 ]; then  # connect
#        networksetup -setnetworkserviceenabled "$networkService" on   
#    fi
#}


function vpn() {
    if [ "$#" -ne 1 ]; then
        scutil --nc status "OTEVPN" | sed -n 1p #| grep -qv Connected
    elif [ $1 -eq 0 ]; then  # disconnect
        vpn-disconnect
    elif [ $1 -eq 1 ]; then  # connect
        vpn-connect
    fi
}


function vpn-connect {
/usr/bin/env osascript <<-EOF
tell application "System Events"
        tell current location of network preferences
                set VPN to service "OTEVPN" -- your VPN name here
                if exists VPN then
                     connect VPN
                     delay 3
                     keystroke "a73jv9uk"
                     key code 36
                end if

                --repeat while (current configuration of VPN is not connected)
                --    delay 1
                --end repeat
        end tell
end tell
EOF
}


function vpn-disconnect {
/usr/bin/env osascript <<-EOF
tell application "System Events"
        tell current location of network preferences
                set VPN to service "OTEVPN" -- your VPN name here
                if exists VPN then disconnect VPN
        end tell
end tell
return
EOF
}

export PATH=.:"$HOME"/bin:"$PATH"
export LANG=en_US.UTF-8
export EDITOR=vim
#export LC_CTYPE=C
#export LANG=C
export OTEPASS="a73jv9uk"
alias otepass='echo -n $OTEPASS | pbcopy'

proxied_git () 
( 
    export GIT_PROXY_COMMAND=/tmp/gitproxy;

    cat  > $GIT_PROXY_COMMAND <<EOF
#!/bin/bash
/usr/bin/socat - PROXY:10.101.13.55:\$1:\$2,proxyport=3128
EOF
    chmod +x $GIT_PROXY_COMMAND;

    git "$@"
)

export rest_mock="$HOME/work/ultimate/rest-mock"
export PROD_LOG_PATH='/app/wildfly-10.1.0.Final/applicationlogs/Widget.log'
alias ls='ls -F'
export MANWIDTH=80
alias crontab="VIM_CRONTAB=true crontab"
#export MAIL=/Users/cac/Mail/cognity/inbox
#export MAIL=/Users/cac/Mail/cognity/personal
#export http_proxy="proxy.ote.gr:8080"

function proxy_on() {
    export no_proxy="localhost,127.0.0.1,localaddress,.localdomain.com"

    if (( $# > 0 )); then
        valid=$(echo $@ | sed -n 's/\([0-9]\{1,3\}.\)\{4\}:\([0-9]\+\)/&/p')
        if [[ $valid != $@ ]]; then
            >&2 echo "Invalid address"
            return 1
        fi

        export http_proxy="http://$1/" \
               https_proxy=$http_proxy \
               ftp_proxy=$http_proxy \
               rsync_proxy=$http_proxy
        echo "Proxy environment variable set."
        return 0
    fi

    echo -n "username: "; read username
    if [[ $username != "" ]]; then
        echo -n "password: "
        read -es password
        local pre="$username:$password@"
    fi

    echo -n "server: "; read server
    echo -n "port: "; read port
    export http_proxy="http://$pre$server:$port/" \
           https_proxy=$http_proxy \
           ftp_proxy=$http_proxy \
           rsync_proxy=$http_proxy \
           HTTP_PROXY=$http_proxy \
           HTTPS_PROXY=$http_proxy \
           FTP_PROXY=$http_proxy \ 
           RSYNC_PROXY=$http_proxy
}

function proxy_off(){
    unset http_proxy https_proxy ftp_proxy rsync_proxy \
          HTTP_PROXY HTTPS_PROXY FTP_PROXY RSYNC_PROXY
    echo -e "Proxy environment variable removed."
}

