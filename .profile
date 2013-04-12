#export LC_TIME=el_GR.utf8

#
# Your previous .profile  (if any) is saved as .profile.dpsaved
# Setting the path for DarwinPorts.
export PATH=$PATH:/usr/local/mysql/bin
#export PKG_CONFIG_PATH=/Library/Frameworks/Mono.framework/Versions/Current/lib/pkgconfig
#export PS1="\W @ \h (\u) \$ "
#export PS1="\h \W % "
#export PS1="\[\e[1m\]\h:\W \u\$\[\e[0m\] "  # ἁπλῶς ἔντονα
#export PS1="\[\e[0;34m\]\h:\W \u\$\[\e[0m\] " # θαλασσύ
#export PS1="\[\e[0;36m\]\h:\w \u\$\[\e[0m\] " # πρασινοθαλασσύ

# export PS1="\[\033]0;\u@\h: \w\007\][\u@\h: \w]\$ "
# export PS1="\[\033]0;\u@\h: \w\007\][\u@\h] \w \$ "
#export PS1="\[\033[1;34m\]\u@\h \w \$\[\033[0m\] "

# Προτροπή γιά ἀνοικτόχρωμα παρασκήνια (backgrounds)
#export PS1='\[\e[0;34m\][\u@\h \W]\$\[\e[0m\] ' # κυανῆ προτροπή
#######

#export PS1='\[\e[0;37m\][\u@\h \W]\$\[\e[0m\] '  # φαιά προτροπή
#export PS1="\[\033[34m\][\$(date +%H%M)][\u@\h:\w]$ "
#umask 077







##############   ΓΙΑ CABAL   ###########################################
export PATH=$PATH:/Users/christos/.cabal/bin/

######################


#export PS1="[\u@\h: \w]$ "
 
#export LD_LIBRARY_PATH=/usr/local/lib/gtkada:/usr/local/lib:/System/Library/Frameworks/Python.framework/Versions/2.3/lib:/System/Library/Frameworks/Python.framework/Versions/2.3/lib/python2.3:/Users/christoschryssochoidis/Documents/Software_Engneering/cgal/CGAL-3.3.1/lib/i386_Darwin-9.0_g++-4.0.1:/usr/local/lib/i386_Darwin-8.10_g++-4.0.1:/usr/local/ada-4.3/bin:/usr/local/lib:/usr/local/ada-4.3/lib/gcc/i686-apple-darwin9/4.3.0:/usr/local/ada-4.3/lib/:/usr/local/ada-4.3/lib/gcc/i686-apple-darwin/4.3.0/adalib:$LD_LIBRARY_PATH
#export DYLD_LIBRARY_PATH=/usr/local/lib/gtkada:/usr/local/lib:/System/Library/Frameworks/Python.framework/Versions/2.3/lib:/System/Library/Frameworks/Python.framework/Versions/2.3/lib/python2.3:/Users/christoschryssochoidis/Documents/Software_Engneering/cgal/CGAL-3.3.1/lib/i386_Darwin-9.0_g++-4.0.1:/usr/local/ada-4.3/lib/gcc/i686-apple-darwin9/4.3.0/adalib:/opt/local/lib/swipl-5.6.44/lib/i386-darwin8.10.1:/usr/local/lib:/usr/local/lib/i386_Darwin-8.10_g++-4.0.1:/usr/local/ada-4.3/lib/gcc/i686-apple-darwin9/4.3.0/adalib:/usr/local/ada-4.3/lib/:/usr/local/ada-4.3/lib/gcc/i686-apple-darwin9/4.3.0/adalib:$DYLD_LIBRARY_PATH


################   MODULA-3   ####################################
#export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:/usr/local/cm3/lib:/usr/local/mysql/lib
############## ΤΕΛΟΣ MODULA-3 ####################################

#export adalib=/usr/local/ada-4.3/lib/gcc/i686-apple-darwin/4.3.0/adalib:/usr/local/ada-4.3/lib/gcc/i686-apple-darwin9/4.3.0/adalib
#export adainclude=/usr/local/ada-4.3/lib/gcc/i686-apple-darwin/4.3.0/adainclude:/usr/local/ada-4.3/lib/gcc/i686-apple-darwin9/4.3.0/adainclude



#export LC_ALL=el_GR.UTF-8
#export LC_CTYPE=el_GR.UTF-8
#export LC_NUMERIC=el_GR.UTF-8
#export CLICOLOR=1
#export LSCOLORS=ExFxCxDxBxegedabagacad
#export DISPLAY=:0.0

#export CPATH=/sw/include:/sw/include/boost-1_34_1:/Users/christoschryssochoidis/Documents/Software_Engneering/cgal/CGAL-3.3.1/include:/System/Library/Frameworks/Python.framework/Headers:$CPATH

#export TERM=xterm-16color
#export EDITOR="emacsclient -c"
#export VISUAL="emacsclient -c"
# alias vi="emacsclient -c"
alias ssh="TERM=vt100 ssh"
alias P2M="PolytonicToMonotonicTextFilter"
#alias ls="ls -F --color -h"
alias rm="rm -i"
alias port="port -v"
alias mutt="/usr/local/bin/mutt"
#test -r /sw/bin/init.sh && . /sw/bin/init.sh

# Setting PATH for MacPython 2.5
# The orginal version is saved in .profile.pysave
#PATH=/usr/local/include/boost-1_34_1:${PATH}
#export PATH


#Γιὰ σκοτεινὰ φόντα
#export CLICOLOR=true export LSCOLORS=dxfxcxdxbxegedabagacad
#Γιὰ φωτεινὰ φόντα
#export CLICOLOR=true export LSCOLORS=ExFxCxDxBxegedabagacad

#export LS_OPTIONS='-h --color=auto'
export CLICOLOR=1
export LSCOLORS=GGFxCxDxBxegedabagacad
#LS_COLORS="ow=94:di=34"
#export LS_COLORS
#export LSCOLORS='Bxgxfxfxcxdxdxhbadbxbx'
alias ls="ls -F -h "
#export CLICOLOR=1
#export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
#export LS_COLORS="di=01;33" # γιὰ σκοῦρο ὑπόβαθρο

#export CGAL_MAKEFILE="/Users/christoschryssochoidis/Software_Engineering/cgal/CGAL-3.3.1/make/makefile_i386_Darwin-9.1_g++-4.0.1"

#QTDIR=/sw/lib/qt3mac
#PATH=$QTDIR/bin:$PATH
#DYLD_LIBRARY_PATH=$QTDIR/lib:$DYLD_LIBRARY_PATH

#δικό μου αὐτό...
#export LD_LIBRARY_PATH=$QTDIR/lib:$LD_LIBRARY_PATH

#export QTDIR PATH DYLD_LIBRARY_PATH

#alias java=/System/Library/Frameworks/JavaVM.framework/Versions/1.6/Commands/java
#export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/1.6/Home

alias javac6="/System/Library/Frameworks/JavaVM.framework/Versions/1.6/Home/bin/javac"
alias java6="/System/Library/Frameworks/JavaVM.framework/Versions/1.6/Home/bin/java"

alias javac5="/System/Library/Frameworks/JavaVM.framework/Versions/1.5/Home/bin/javac"
alias java5="/System/Library/Frameworks/JavaVM.framework/Versions/1.5/Home/bin/java"






#export CLASSPATH=/Applications/Eclipse/plugins/org.eclipse.jdt.core_3.3.1.v_780_R33x.jar:.:/Users/christoschryssochodis/java/classes

alias ecj="java org.eclipse.jdt.internal.compiler.batch.Main -source 1.5"



#alias gnatmake="/usr/local/ada-4.3/bin/gnatmake"

#export EDITOR=vim
#export EDITOR=emacs
#export SUDO_USER=christoschryssochodis

#alias xelatex="xelatex -output-driver='xdvipdfmx -q -E'"
#alias emacs="$HOME/emacs/nextstep/Emacs.app/Contents/MacOS/Emacs -nw --debug-init"


#alias rm="rm -i"
# Setting PATH for MacPython 2.5
# The orginal version is saved in .profile.pysave
#PATH="/Library/Frameworks/Python.framework/Versions/Current/bin:${PATH}"
#export PATH



## <SCALA>
export SCALA_HOME="/Users/christos/SDKs/scala-2.8.0.final"
PATH=$SCALA_HOME/bin:$PATH
## </SCALA>

#####################  HIBERNATION ALIASES   ###########################################
alias hibernateon="sudo pmset -a hibernatemode 1"
alias hibernateoff="sudo pmset -a hibernatemode 3"

##############################   PYTHON   #################################################
export PYTHONSTARTUP=/Users/christos/.pythonrc.py
#export PYTHONPATH=/Library/Python/2.6/site-packages:/Library/Frameworks/Python.framework/Versions/2.6/lib/python2.6/site-packages:/Library/Frameworks/Python.framework/Versions/2.6/lib/python2.6/site-packages/setuptools-0.6c11-py2.6.egg:/Library/Frameworks/Python.framework/Versions/2.6/lib/python2.6/site-packages/Trac-0.12-py2.6.egg:/Library/Frameworks/Python.framework/Versions/2.6/lib/python2.6/lib-dynload/zlib.so:/Library/Frameworks/Python.framework/Versions/2.6/lib/python2.6/lib-dynload:/Library/Frameworks/Python.framework/Versions/2.6/lib/python2.6/site-packages/Genshi-0.6-py2.6/genshi:/Library/Frameworks/Python.framework/Versions/2.6/lib/python2.6/site-packages/mod_python
#####################################




###############################  MANPATH #######################################################
export MANPATH=/Developer/usr/share/man:/usr/local/share/man:/usr/local/man:/opt/local/share/man:/Library/Frameworks/GHC.framework/Versions/Current/usr/share/man:$MANPATH

##############################################################
#export LC_CTYPE=el_GR.UTF-8

##############################################################

alias qlf='qlmanage -p "$@" >& /dev/null'


# Disable case sensitive expansion - for command like "ls ld a*" to list "A_file"
# Note for things like "ls -ld a_file.txt", we still need to force it to glob by "ls -ld [a]_file.txt"
shopt -s nocaseglob



#alias γιὰ OCaml
alias ocaml="rlwrap ocaml"

# path=$PATH:$HOME/godi/bin:$HOME/godi/sbin 
#alias γιὰ SMLNJ
alias sml="rlwrap sml"
#alias γιὰ SBCL
alias sbcl="rlwrap sbcl"

export PATH=$PATH:/Users/christos/local/erlang


# Γιὰ MacPosrts
#export PATH=/opt/local/bin:/opt/local/sbin:$PATH

# Γιὰ GNAT Ada
#PATH=/usr/local/gnat/bin:$PATH

# Γιὰ MacPorts
PATH=$PATH:/Users/christos/bin

export PATH

#  Γιὰ ConTeXt
#export TEXMFCNF=/usr/local/texlive/2008/texmf/web2c/
export OSFONTDIR="/Library/Fonts;/Users/christos/Library/Fonts"

##
# Your previous /Users/christos/.profile file was backed up as /Users/christos/.profile.macports-saved_2009-10-23_at_14:20:58
##

# MacPorts Installer addition on 2009-10-23_at_14:20:58: adding an appropriate PATH variable for use with MacPorts.
export PATH=$PATH:/opt/local/bin:/opt/local/sbin
# Finished adapting your PATH environment variable for use with MacPorts.




##
# Your previous /Users/christos/.profile file was backed up as /Users/christos/.profile.macports-saved_2009-11-02_at_23:38:26
##

# MacPorts Installer addition on 2009-11-02_at_23:38:26: adding an appropriate PATH variable for use with MacPorts.
#export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

################ ΔΙΑ ΤΗΝ ΓΛΩΣΣΑΝ GO ########################
GOROOT=$HOME/go
export GOROOT

GOOS=darwin
export GOOS

GOARCH=amd64
export GOARCH


#############################

#ulimit -v 1000000    # stack 1GB, διὰ νὰ μὴ καταλάβῃ ὅλην τὴν μνήμη τοῦ ὑπολογιστοῦ

##############################

#export LESS="-Pm ?f%f .?pb%pb\%:?lbLine %lb:?bbByte %bb:-... $ -m"



# Πρόσθεσις τῆς ~/bin τῇ PATH
export PATH="$HOME"/.cabal/bin:"$HOME"/bin:$PATH

#######################################

# function man()
# {
# #	echo "$*";
#     /usr/bin/man "$*" > /tmp/"${!#}"; less /tmp/"${!#}" 
# }


#export PATH=/usr/local/bin:$PATH


export LC_CTYPE=en_US.UTF-8


export DEVHOME="$HOME"/devel
export ANDROIDTOOLS="$HOME"/SDKs/android-sdk-mac_86/tools
export ANDROID="$HOME"/SDKs/android-sdk-mac_86
export PATH="$ANDROIDTOOLS":$PATH


export DICPATH=/opt/local/share/hunspell/
export DICTIONARY=en_US

PRINTER=192.168.1.15



alias "netsleep?"='if  ! (ps -ax -O start | grep -v grep | grep netsleep) ; then echo netsleep not active; fi'
alias "sudo-netsleep"="sudo -b netsleep"
alias netsleep-s="sudo -b netsleep"
####  ΔΙΑ GIT ######################
export MANPATH=/usr/local/git/share/man:$MANPATH
export PATH=/usr/local/git/bin:$PATH

##### ΔΙΑ JAVA #########################
#export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home
##
# Your previous /Users/christos/.profile file was backed up as /Users/christos/.profile.macports-saved_2010-04-26_at_03:49:08
##

# MacPorts Installer addition on 2010-04-26_at_03:49:08: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.




# Setting PATH for MacPython 2.6
# The orginal version is saved in .profile.pysave
# PATH="/Library/Frameworks/Python.framework/Versions/2.6/bin:${PATH}"
# export PATH



# Θέσις PATH γιὰ MacPython 3.1
PATH="/Library/Frameworks/Python.framework/Versions/3.1/bin:${PATH}"
export PATH

export ONLOCATION=Automatic
export OFFLOCATION=disconnected
export PATH=$PATH:$HOME/sdk/lua/Current
export PATH=$PATH:$HOME/.local/bin

chars() { l="$@"; echo ${#l};}

### APCHE MAVEN
export PATH="$HOME"/tools/apache-maven-2.2.1/bin:$PATH

#######  CLASSPATH  ###############
export CLASSPATH=.:/Users/christos/lib/clojure-contrib/target/clojure-contrib-1.2.0-SNAPSHOT.jar


PATH=/usr/local/bin:$PATH
#PATH=/Library/Frameworks/Python.framework/Versions/2.6/lib/python2.6/site-packages:$PATH
export PATH

function en0 () {
    case "$1" in
    up)
        #sudo -k
        sudo ifconfig en0 up
        ;;
    down)
        sudo ifconfig en0 down
        ;;
    "")
        ifconfig en0
        ;;
    *)
        echo "Usage: en0 [up | down]"
        echo    
        ;;
    esac
}


#export VIM_APP_DIR=/Applications/MacVim-7_3a-BETA-52_1

# modified from http://www.nanoant.com/programming/opening-specified-path-in-terminals-new-tab
alias twd=new_terminal_working_directory
function new_terminal_working_directory() {
osascript <<END 
        tell application "Terminal"
    	    tell application "System Events" to tell process "Terminal" to keystroke "t" using command down
            do script "cd $(pwd)" in first window
        end tell
END
}

# GRAPHVIZ - DOT
HAVE_DOT=YES
DOT_PATH=/usr/local/graphviz-2.14/bin

####  ΔΙΑ INFO
INFOPATH="$HOME"/info:$INFOPATH

# Setting PATH for Python 2.7
# The orginal version is saved in .profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH
export PYTHONPATH=/usr/local/lib/python2.7/site-packages #:/Library/Python/2.7/site-packages:/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages:${PYTHONPATH}
# ΓΙΑ SVN ΑΠΟ COLLABNET
export PATH=/opt/subversion/bin:$PATH

#Γιά Android
export PATH=${HOME}/SDKs/android-sdk-mac_x86/tools:${PATH}

# Setting PATH for MacPython 2.6
# The orginal version is saved in .profile.pysave
#PATH="/Library/Frameworks/Python.framework/Versions/2.6/bin:${PATH}"
#export PATH

# Setting PATH for MacPython 2.6
# The orginal version is saved in .profile.pysave
#PATH="/Library/Frameworks/Python.framework/Versions/2.6/bin:${PATH}"
#export PATH
export DOTFILES="$HOME/.vimrc $HOME/.gvimrc $HOME/.profile $HOME/.emacs.d/init.el $HOME/.emacs.d/keyboard-meta-command.el $HOME/.emacs.d/org-custom.el $HOME/.pythonrc.py $HOME/.irbrc $HOME/.ghci"




function internetoff()
{
	rule=$(($(($RANDOM % 30000)) + 35000))  # random number between 35000 and 65000, since $RANDOM in [0, 32767]
#	iPhoneRuleNum=$(($rule - 100))
#	blockRule="ipfw add $rule deny tcp from any to any via en0; sleep $(($1 * 60)); ipfw delete $rule"
	sudo -b sh -c "(ipfw add $rule deny ip from not 192.168.0.3 to not\
        192.168.0.3 via en0; sleep $1h; ipfw delete $rule) > /dev/null"
}


### Βοηθητικαὶ μεταβληταὶ γιὰ iCore ######
export ICORE_LIB="$HOME/work/icore/trunk/lib/icore"
export ICORE_ROOT="$HOME"/work/icore/trunk
export ICORE_TEST="$HOME"/work/icore-test

#if [ -f /etc/bash_completion ]; then
#   . /etc/bash_completion
#fi
#
#bla()
#{
#  echo "bla!";
#}

# Ἀπενεργοποίησον τὴν ἐπέκτασιν τοῦ tilde (~)
_expand()
{
    return 0;
}


#alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs -nw"
alias vim=/Applications/MacVim.app/Contents/MacOS/Vim



export PKG_CONFIG_LIBDIR=/usr/lib/pkgconfig

### Θὲς MANPATH γιὰ /usr/local/share/man
export MANPATH=/usr/local/share/man:$MANPATH


### Βοηθητικὴ μεταβλητὴ γιὰ Loop
export LOOP_DIR=/usr/local/share/lua/5.1/loop

### Κάμνε τὸ περιβάλλον τὴν Lua λίγο φιλικώτερο…
alias lua="rlwrap lua" 


export LUA_PATH=";;${HOME}/src/lua-stdlib/src/?.lua;/usr/local/share/lua/5.1/?.lua;${HOME}/lib/lua/?.lua;${HOME}/?.lua;./?.lua;?/init.lua;${HOME}/src/lua-xpath/?.lua;"
alias del="rm -i"

export TEXDIR="/usr/local/texlive/2012/texmf-dist/tex"
#export CDPATH="~/Developer:~/work:~/devel/git-svn:~/devel/git:~/devel"
export CDPATH=.:~/Work
alias luatex="rlwrap luatex"
alias xetex="rlwrap xetex"
alias lualatex="rlwrap lualatex"
alias xelatex="rlwrap xelatex"
#LESS="-IRm -FXRS -x4"; export LESS

##################  EMACS ##########################################
export PATH=/Applications/Emacs.app/Contents/MacOS/:/Applications/Emacs.app/Contents/MacOS/bin:${PATH}
alias emacscl="emacsclient -n"
alias emc="emacsclient -nw"
#export ALTERNATE_EDITOR="emacs -nw" EDITOR=emacsclient VISUAL=emacsclient
#export EDITOR=emacsclient
export PATH=$HOME/local/bin:$PATH
export MANPATH=$HOME/local/share/man:$MANPATH
export LANG=en_US.UTF-8

# Source the git bash completion file
if [ -f /usr/local/git/contrib/completion/git-completion.bash ]; then
    source /usr/local/git/contrib/completion/git-completion.bash
fi

if [ -f /usr/local/git/contrib/completion/git-prompt.sh ]; then
    #source ~/.git-prompt.sh
    source /usr/local/git/contrib/completion/git-prompt.sh
    GIT_PS1_SHOWDIRTYSTATE=true
    GIT_PS1_SHOWSTASHSTATE=true
    #GIT_PS1_SHOWUPSTREAM=verbose
    #PS1='\u@\h: \w[$(__git_ps1 " (%s)")]\n\$ '
    #PS1='\u@\h: \w[$(__git_ps1)]\$ '
    temp="$(tty)"
    cur_tty="${temp:5}" # The tty we are working on
    #export PS1="\u@\h:${cur_tty}:\W\$(__git_ps1) > "
	#export PS1="\u@\h:\W\$(__git_ps1) % "
	export PS1="[\u@\h: \W] $ "
    #PS1='\u@\h: \w $(hg_git_ps1 "(%s)")\n\$ '
fi

# Source the svn bash completion file
if [ -f ~/.svn-completion.sh ]; then
    source ~/.svn-completion.sh
fi

#source /usr/local/etc/bash_completion.d/hg-completion.bash

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

export PATH=.:$PATH
export JIRA_HOME="$HOME/jira-projects"

##
# Your previous /Users/christos/.profile file was backed up as /Users/christos/.profile.macports-saved_2011-08-02_at_18:45:35
##

# MacPorts Installer addition on 2011-08-02_at_18:45:35: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

#export PATH=/usr/local/ActivePerl-5.14/bin:$PATH

# For OCaml's GODI
export PATH=$PATH:/opt/godi/bin:/opt/godi/sbin
export MANPATH=$MANPATH:/opt/godi/man

##
# Your previous /Users/christos/.profile file was backed up as /Users/christos/.profile.macports-saved_2011-10-31_at_18:07:58
##

# MacPorts Installer addition on 2011-10-31_at_18:07:58: adding an appropriate PATH variable for use with MacPorts.
export PATH=/usr/local/bin:/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

# edit file with root privs
alias E="EDITOR=\"emacsclient -c -a emacs\" sudoedit"

# Heirloom userland 
HEIRLOOM=/opt/heirloom 
if [ -d $HEIRLOOM ] 
then
    export HEIRLOOM
    PATH=$PATH:$HEIRLOOM/5bin 
else
    unset HEIRLOOM 
fi



export PATH=/usr/local/bin:${PATH}

export PATH=/usr/local/Cellar/ruby/1.9.3-p0/bin:$PATH


# RVM (Ruby enVironment Manager)
#export MANPATH=/Users/christos/.rvm/man:$MANPATH
#export PATH=${HOME}/.rvm/bin:${PATH}
#
#[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

#alias git=hub
export PATH=/usr/local/share/python:${PATH}

#hg_ps1() {
#    hg prompt "({on {branch}}{ at {bookmark}} {status})" 2> /dev/null
#}

#export GIT_PS1_SHOWDIRTYSTATE=true
#export GIT_PS1_SHOWSTASHSTATE=true
#export GIT_PS1_SHOWUNTRACKEDFILES=true
#export GIT_PS1_ENABLED=true
function disable_git_ps1
{
  export GIT_PS1_ENABLED=false
}

function enable_git_ps1
{
  export GIT_PS1_ENABLED=true
}

function git_ps1
{
  $GIT_PS1_ENABLED && __git_ps1 "(%s) "
}


function hg_ps1
{
  hg prompt "({root|basename}@{bookmark}{[{tags|quiet|,}]}{ {status|modified|unknown}}{ {shelf}}) " 2> /dev/null
}

hg_git_ps1() {
    if [ -d ".hg" ]; then
            hg_ps1
    else if [ -d ".git" ]; then  # only git
        __git_ps1 "(%s)"
    else if [ -n "$(__git_ps1 '%s')" ]; then
            __git_ps1 "(%s)"
    else 
        hg prompt 2> /dev/null
        if [ $? -eq 0 ]; then
            hg_ps1 "(%s)"
         fi
       fi
     fi
    fi
}
#export PS1='\u@\h: \w $(hg_git_ps1)\n$ '
ALTERNATE_EDITOR=emacs
#alias emacsclient="emacsclient -t"

export PATH=$HOME/bin:$PATH
alias t="todo.sh"
export PATH=${HOME}/bin/todo.txt_cli:$PATH

export PATH=/Applications/MacVim.app/Contents/MacOS:$PATH

PATH=/usr/local/ActivePerl-5.14/bin:$PATH
export PATH

alias tclsh="rlwrap tclsh"

PATH=/usr/local/sbin:$PATH
export PATH

#CATALINA_HOME="$HOME/apache-tomcat-7.0.29"
#CATALINA_HOME="$HOME/apache-tomcat-7.0.28"
#$export CATALINA_HOME

#JRE_HOME="/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home"
#export JRE_HOME

CVSROOT=:pserver:cchryssochoidis:94Thermo80@v-srv-atlas:/cvsrep; export CVSROOT
# port:2401

#export PS1='\e[33m\][\W] \e[32m\]$(git_ps1)\e[31m\]$(hg_ps1)\e[0m\]'
#export PS1='\e[33m\][\W] \e[32m\]$(git_ps1)\e[31m\]\e[0m\]'
#export PS1='\u@\h:\w\$ \[\e[32m\]$(git_ps1)\[\e[31m\]\[\e[0m\]'
#export PS1='\w\$'
#export PS1='\e[33m\][\W] \e[32m\]$(git_ps1)\e[0m\]'
#export PS1='\e[33m\][\W]\e[0m\]'
export JAVA_HOME=$(/usr/libexec/java_home)

CLASSPATH=.:/Users/christos/lib/jars/antlr-3.4.jar:$CLASSPATH

alias findp="ps -axww | grep $*"

alias jdb="rlwrap jdb"

shopt -s cdable_vars

alias svndiff="svn diff --diff-cmd ${HOME}/bin/opendiff-svn-wrapper.sh"


# Git/Subversion prompt function
__git_svn_ps1() {
    local s=
    if [[ -d ".svn" ]] ; then
        local r=`__svn_rev`
        local b=`__svn_branch`
        s=" [$b:$r]"
    elif [[ -d .git ]] ; then
        s=`__git_ps1`
    fi
    echo -n "$s"
}

# Outputs the current trunk, branch, or tag
__svn_branch() {
    local url=
    if [[ -d .svn ]]; then
        url=`svn info | awk '/URL:/ {print $2}'`
        if [[ $url =~ trunk ]]; then
            echo trunk
        elif [[ $url =~ /branches/ ]]; then
            echo $url | sed -e 's#^.*/\(branches/.*\)/.*$#\1#'
        elif [[ $url =~ /tags/ ]]; then
            echo $url | sed -e 's#^.*/\(tags/.*\)/.*$#\1#'
        fi
    fi
}

# Outputs the current revision
__svn_rev() {
    local r=$(svn info | awk '/Revision:/ {print $2}')

    if [ ! -z $SVN_SHOWDIRTYSTATE ]; then
        local svnst flag
        svnst=$(svn status | grep '^\s*[?ACDMR?!]')
        [ -z "$svnst" ] && flag=*
        r=$r$flag
    fi
    echo $r
}

#export PS1='\[\e[33m\]\u@\h:\w\$ \[\e[32m\]$(git_ps1)\[\e[31m\]\[\e[0m\]'
#export PS1='\[\e[33m\]\u@\h:\W\$ \[\e[32m\]$(__git_svn_ps1)\[\e[31m\]\[\e[0m\]'
#export PS1='\[\e[33m\]\u@\h:\W>\[\e[32m\]$(__git_svn_ps1)\[\e[31m\]\[\e[0m\] '
#export PS1='\[\e[1;34m\]\u@\h:\W>\[\e[32m\]$(__git_svn_ps1)\[\e[31m\]\[\e[0m\] '
PATH=$PATH:${HOME}/sdk/gwt-2.5.0/
export PATH

export PATH=/opt/subversion/bin:$PATH
export PATH=/usr/local/git/bin:$PATH

alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs -nw --color=no"

#alias em="emacs -nw --color=no"
alias sqlite3="rlwrap sqlite3"
alias sqlite="rlwrap sqlite3"

shopt -s extglob
shopt -s globstar
temp="$(tty)"
cur_tty="${temp:5}" # The tty we are working on

alias emls="ps | grep 'em ' | grep ${cur_tty} | grep -v grep"
alias lsem="ps | grep 'em ' | grep ${cur_tty} | grep -v grep"
alias lem="ps | grep 'em ' | grep -v grep"

alias e="ps | grep 'em ' | grep ${cur_tty} | grep -v grep"
