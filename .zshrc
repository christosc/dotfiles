PROMPT="%m %~ %# "
CDPATH=.:~/devel/git-svn:~/devel/git:~/devel/svn:~/devel:
PATH="/usr/local/bin:/usr/bin:/usr/texbin:$HOME/bin"

alias ls="ls -h --color"
        
zstyle ':completion:*' completer _complete _correct _complete:foo
zstyle ':completion:*:complete:*' matcher-list  '' 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*:foo:*' matcher-list 'm:{a-zA-Z}={A-Za-z} r:|[-_./]=* r:|=*'

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
## Source the git bash completion file
#if [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
#    source /usr/local/etc/bash_completion.d/git-completion.bash
#    GIT_PS1_SHOWDIRTYSTATE=true
#    GIT_PS1_SHOWSTASHSTATE=true
#    PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
#fi
#
## Source the svn bash completion file
#if [ -f ~/.svn-completion.sh ]; then
#    source ~/.svn-completion.sh
#fi
