# Powerline-style prompt for bash.
#
# Segments: time | working directory | vcs branch | exit code (on failure).
# The separator and branch glyphs live in the Private Use Area, so a
# Nerd Font (or Powerline-patched font) is required; set PL_ASCII=1
# before sourcing for a plain-text fallback.
#
# PS1 is assigned once, here, and never rewritten afterwards: tools that
# drive bash programmatically install their own prompt and must keep it.

case $- in *i*) ;; *) return 0 ;; esac

if [[ ${PL_ASCII:-0} = 1 ]]; then
    PL_SEP='>'
    PL_BRANCH='#'
else
    PL_SEP=$'\ue0b0'
    PL_BRANCH=$'\ue0a0'
fi

# 256-colour indices, background then foreground.
PL_TIME_BG=${PL_TIME_BG:-236}; PL_TIME_FG=${PL_TIME_FG:-252}
PL_CWD_BG=${PL_CWD_BG:-240};   PL_CWD_FG=${PL_CWD_FG:-253}
PL_VCS_BG=${PL_VCS_BG:-73};    PL_VCS_FG=${PL_VCS_FG:-236}
PL_ERR_BG=${PL_ERR_BG:-160};   PL_ERR_FG=${PL_ERR_FG:-231}
PL_ROOT_BG=${PL_ROOT_BG:-88}

# Keep long paths from eating the line; \w is trimmed by bash itself.
PROMPT_DIRTRIM=${PROMPT_DIRTRIM:-4}

# Colour changes must be invisible to readline's line-length arithmetic.
# In the literal part of PS1 that means \[ ... \]; in text produced by the
# command substitution below, bash never sees \[, so the raw readline
# markers \001 and \002 have to be emitted instead.
__PL_ESC=$'\033'
__PL_NP_ON=$'\001'
__PL_NP_OFF=$'\002'

__pl_sgr() { printf '%s' "${__PL_NP_ON}${__PL_ESC}[${1}m${__PL_NP_OFF}"; }

# Everything that varies per command: branch, failure code, closing arrow.
__pl_tail() {
    local last_exit=$1 prev=$PL_CWD_BG out='' branch

    branch=$(_scm_prompt '%s' 2>/dev/null)
    if [[ -n $branch ]]; then
        out+="$(__pl_sgr "38;5;${prev};48;5;${PL_VCS_BG}")$PL_SEP"
        out+="$(__pl_sgr "38;5;${PL_VCS_FG};48;5;${PL_VCS_BG}") $PL_BRANCH $branch "
        prev=$PL_VCS_BG
    fi

    if (( last_exit != 0 )); then
        out+="$(__pl_sgr "38;5;${prev};48;5;${PL_ERR_BG}")$PL_SEP"
        out+="$(__pl_sgr "38;5;${PL_ERR_FG};48;5;${PL_ERR_BG}") $last_exit "
        prev=$PL_ERR_BG
    fi

    printf '%s' "$out$(__pl_sgr 0)$(__pl_sgr "38;5;${prev}")$PL_SEP$(__pl_sgr 0) "
}

__pl_compose() {
    local time_bg=$PL_TIME_BG title=''

    (( EUID == 0 )) && time_bg=$PL_ROOT_BG
    case $TERM in
        xterm*|rxvt*|screen*|tmux*) title='\[\e]0;\u@\h: \w\a\]' ;;
    esac

    printf '%s' "$title${debian_chroot:+($debian_chroot)}"
    printf '%s' '\['"\e[38;5;${PL_TIME_FG};48;5;${time_bg}m\e[1m"'\] \t '
    printf '%s' '\['"\e[0m\e[38;5;${time_bg};48;5;${PL_CWD_BG}m"'\]'"$PL_SEP"
    printf '%s' '\['"\e[38;5;${PL_CWD_FG};48;5;${PL_CWD_BG}m"'\] \w '
    printf '%s' '$(__pl_tail $?)'
}

__PL_OLD_PS1=$PS1
__PL_NEW_PS1=$(__pl_compose)

pl_off() { PS1=$__PL_OLD_PS1; }
pl_on()  { PS1=$__PL_NEW_PS1; }

pl_on
