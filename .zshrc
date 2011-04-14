PROMPT="%m %~ %# "
CDPATH=.:work
PATH="/usr/local/bin:/usr/bin:/usr/texbin:$HOME/bin"

alias ls="ls -h --color"
        
zstyle ':completion:*' completer _complete _correct _complete:foo
zstyle ':completion:*:complete:*' matcher-list \ 
    '' 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*:foo:*' matcher-list \ 
    'm:{a-zA-Z}={A-Za-z} r:|[-_./]=* r:|=*'
