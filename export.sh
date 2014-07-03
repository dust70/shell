# {{{ test for an interactive shell
case $- in
    !*i*) return ;;
esac
#}}}

# {{{ STARTUP PROMPT
# using "birthday" and "calendar" to inform me about
# birthday and important events/anniversary with a
# modified look
if [[ -z $CYG_SYS_BASHRC ]]; then
    # clear screen once
    clear

    builtin echo "--- $(date '+%a %d %b %Y') -------------------------------------------------------------"
    uname -snr
    uptime
    builtin echo -e "---------------------------------------------------------------------------------"
fi
#}}}

# {{{ EDITOR
# setting the EDITOR environment
export EDITOR="${EDITOR:-vim}"
#}}}

# {{{ PAGER
# setting the PAGER environment
if [[ -x ~/.vim/bundle/Pager/vimpager ]]; then
    export PAGER=~/.vim/bundle/Pager/vimpager
elif [[ -x /usr/bin/vimpager ]]; then
    export PAGER=vimpager
elif [[ -x /usr/share/vim/vimcurrent/macros/less.sh ]]; then
    export PAGER=/usr/share/vim/vimcurrent/macros/less.sh
fi
#}}}

# {{{ VISUAL
# setting the VISUAL environment to the same es EDITOR
export VISUAL="${EDITOR:-vim}"
#}}}

# {{{ MANWDTH
# setting the textwidth of manpages to 80 symbols, this make manpages more
# readable
export MANWIDTH="80"
#}}}

# {{{ MANOPT
# If ${MANOPT} is set, it will be parsed prior to man’s command line and is
# expected to be in a similar format. As all of the other man specific
# environment variables can be expressed as command line options, and are thus
# candidates for being included in ${MANOPT} it is expected that they will become
# obsolete. N.B. All spaces that should be interpreted as part of an option’s
# argument must be escaped.
export MANOPT="--locale='C'"
#}}}

# {{{ MANPAGER
# If MANPAGER is set, its value is used as the name of the program to use to
# display the man page. If not, then PAGER is used. If that has no value
# either, /usr/bin/less -is is used.
if [[ -x /usr/bin/vimmanpager ]]; then
    export MANPAGER=vimmanpager
elif [[ -x /usr/bin/less ]]; then
    export MANPAGER=/usr/bin/less
fi
#}}}

# {{{ GREP_COLOR
# give the output of grep a more usefull lock
export GREP_COLOR="31;01"
#}}}

# {{{ GREP_OPTIONS
# additional options for grep
export GREP_OPTIONS="--color=auto"
#}}}

# {{{ GZIP BZIP2 LZMA XZ
# default options for gzip, bzip2, lzma and xz
[[ -x /bin/gzip ]]     && export GZIP="--recursive -9"
[[ -x /bin/bzip2 ]]    && export BZIP2="-9"
[[ -x /usr/bin/lzma ]] && export LZMA="-9"
[[ -x /usr/bin/xz ]]   && export XZ_DEFAULTS="--check=sha256 -9"
#}}}

# {{{ TAR_OPTIONS
# The TAR_OPTIONS environment variable specifies default options to be placed in
# front of any explicit options.
export TAR_OPTIONS="--auto-compress --delay-directory-restore --exclude-backups --exclude-caches --no-overwrite-dir --numeric-owner --totals"
#}}}

# {{{ source keychain files if exists
if $(which keychain > /dev/null 2>&1); then
    eval $(keychain --eval --quick --quiet)
fi
#}}}

# vim: filetype=sh textwidth=80 foldmethod=marker
