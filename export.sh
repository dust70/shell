# {{{ test for an interactive shell
case $- in
    !*i*) return
        ;;
esac
[[ -z "$PS1" ]] && return
#}}}

# {{{ STARTUP PROMPT
# using "birthday" and "calendar" to inform me about
# birthday and important events/anniversary with a
# modified look
if [[ -z $CYG_SYS_BASHRC ]]; then
    # clear screen once
    clear

    builtin echo "--- $(date '+%a %d %b %Y') --------------------------------------------------------------"
    uname -snr
    uptime
    builtin echo -e "---------------------------------------------------------------------------------"
fi
#}}}

# {{{ TMOUT
# If this parameter is nonzero, the shell will receive an ALRM signal if a
# command is not entered within the specified number of seconds after issuing a
# prompt. If there is a trap on SIGALRM, it will be executed and a new alarm is
# scheduled using the value of the TMOUT parameter after executing the trap. If
# no trap is set, and the idle time of the terminal is not less than the value
# of the TMOUT parameter, shell terminates. Otherwise a new alarm is scheduled
# to TMOUT seconds after the last key press.
if [[ ${TERM} = linux ]]; then
    export TMOUT="900"
else
    unset TMOUT
fi
#}}}

# {{{ EDITOR
# setting the EDITOR environment
if which nvim > /dev/null 2>&1; then
    EDITOR="nvim"
elif which vim > /dev/null 2>&1; then
    EDITOR="vim"
fi
export EDITOR="${EDITOR:-vi}"
#}}}

# {{{ VISUAL
# setting the VISUAL environment to the same es EDITOR
if which nvim > /dev/null 2>&1; then
    VISUAL="nvim -R"
elif which vim > /dev/null 2>&1; then
    VISUAL="vim -R"
fi
export VISUAL="${VISUAL:-${EDITOR}}"
#}}}

# {{{ MANWDTH
# setting the textwidth of manpages to 80 symbols, this make manpages more
# readable
export MANWIDTH="120"
#}}}

# {{{ TAR_OPTIONS
# The TAR_OPTIONS environment variable specifies default options to be placed in
# front of any explicit options.
export TAR_OPTIONS="--auto-compress --delay-directory-restore --exclude-backups --exclude-caches --no-overwrite-dir --numeric-owner --totals"
#}}}

# {{{ SUDO
[ -x /usr/bin/sudo ] && export SUDO_PROMPT="[sudo] password for %U@%H: "
#}}}

# {{{ TZ
export TZ="Europe/Berlin"
#}}}

# {{{ add SSH and GPG agent
which keychain > /dev/null 2>&1 && eval $(keychain --agents gpg,ssh --eval --quiet)
#}}}

# {{{ language variables
export LC_ADDRESS=de_DE.UTF-8
export LC_COLLATE=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_IDENTIFICATION=en_US.UTF-8
export LC_MEASUREMENT=de_DE.UTF-8
export LC_MESSAGES=en_US.UTF-8
export LC_MONETARY=en_US.UTF-8
export LC_NAME=de_DE.UTF-8
export LC_NUMERIC=en_US.UTF-8
export LC_PAPER=de_DE.UTF-8
export LC_TELEPHONE=de_DE.UTF-8
export LC_TIME=de_DE.UTF-8
unset LC_ALL

export LANG=en_US.UTF-8
export LANGUAGE=en_GB:en_US:en:de_DE:de
#}}}

# vim: filetype=sh textwidth=80 foldmethod=marker
