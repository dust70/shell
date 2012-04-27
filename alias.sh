# {{{ default options for rm and rmdir
alias rm="rm --interactive=once --verbose"
alias rmdir="rmdir --verbose" #}}}

# {{{ create a directory with permission only for the user
alias md="mkdir -m 0700 -p" #}}}

# {{{ delete directories recursivly
alias rd="rmdir --parents" #}}}

# {{{ aliases for ssh
if [[ -x /usr/bin/ssh ]]; then
    # rename ssh connections for details see ~/.ssh/config
    alias gobeteigeuze="ssh beteigeuze"
    alias goeuropa="ssh europa"
    alias gopandora="ssh pandora"
    alias goserver="ssh server"

    # these machines are not under my controll
    alias goberlin="ssh in-berlin"
    alias goinberlin="ssh in-berlin"

    alias gomathematik="ssh mathematik"
fi #}}}

# {{{ default options for ls
alias ls="ls --color=auto --classify --dereference-command-line-symlink-to-dir --hide-control-chars --sort=version"

# some alias for ls to makes things much easier
alias l="ls --human-readable --numeric-uid-gid -l --time-style=+'%Y-%m-%d %H:%m'"
alias la="ls --almost-all"
alias lB="la --ignore-backups"
alias lD="la --directory"
alias li="la --inode"
alias ll="l --almost-all"
alias lZ="la --context"
#}}}

# {{{ default options for euses
[[ -x /usr/bin/euses ]] && alias euses="euses --colour --ignorecase" #}}}

# {{{ default options for genlop
[[ -x /usr/bin/genlop ]] && alias genlop="genlop --info --time --unmerge" #}}}

# {{{ defaults parameter for wget
[[ -x /usr/bin/wget ]] && alias wget="wget --tries=10 --continue --timeout=30 --wait=30" #}}}

# {{{ multitail
if [[ -x /usr/bin/multitail ]]; then
    TAIL="--retry-all"
    [[ -r /var/log/messages ]] && TAIL="${TAIL} -cs -n 1024 /var/log/messages"
    [[ -r /var/log/emerge.log ]] && TAIL="${TAIL} -cS portage -n 1024 /var/log/emerge.log"

    # open favorite log files with multitial
    alias log="eval multitail ${TAIL}"
fi #}}}

# {{{ default options for chmod, chown, chgrp,...
alias chgrp="chgrp --changes"
alias chmod="chmod --changes"
alias chown="chown --changes" #}}}

# {{{ default options for apg
if [[ -x /usr/bin/apg ]]; then
    alias apg="apg -a 1 -n 5 -m 10 -x 25"
    alias apgsncl="apg -M SNCL"
    alias apgncl="apg -M NCL"
fi #}}}

# {{{ use vim insteat of less as pager, less sucks, if it exists
if [[ -x ~/.dotfiles/vim/bundle/VimPager/vimpager ]]; then
    alias less=~/.dotfiles/vim/bundle/VimPager/vimpager
    alias more=~/.dotfiles/vim/bundle/VimPager/vimpager
    alias pager=~/.dotfiles/vim/bundle/VimPager/vimpager
    alias pg=~/.dotfiles/vim/bundle/VimPager/vimpager
elif [[ -x /usr/bin/vimpager ]]; then
    alias less="vimpager"
    alias more="vimpager"
    alias pager="vimpager"
    alias pg="vimpager"
fi #}}}

# {{{ use htop as top replacement
[[ -x /usr/bin/htop ]] && alias top="htop" #}}}

# {{{ default options for df
alias df="df --human-readable --local --print-type"
alias di="df --inodes" #}}}

# {{{ get rid of the leading /sbin/
# alternative: export PATH=${PATH}:/usr/local/sbin:/usr/sbin:/sbin
[[ -x /sbin/ifconfig ]]  && alias ifconfig="/sbin/ifconfig"
[[ -x /sbin/ip ]]        && alias ip="/sbin/ip"
[[ -x /usr/sbin/lspci ]] && alias lspci="/usr/sbin/lspci"
[[ -x /usr/sbin/lsusb ]] && alias lsusb="/usr/sbin/lsusb" #}}}

# {{{ switch file encoding
if [[ -x /usr/bin/recode ]]; then
    [[ ! -x /usr/bin/unix2dos ]] && alias dos2unix="recode ibmpc..lat1"
    [[ ! -x /usr/bin/dos2unix ]] && alias unix2dos="recode lat1..ibmpc"
fi #}}}

# {{{ default options for locate
[[ -x /usr/bin/locate ]] && alias locate="locate --ignore-case --existing --regex" #}}}

# {{{ default options for txt2regex
[[ -x /usr/bin/txt2regex ]] && alias txt2regex="txt2regex --prog egrep,vim,sed" #}}}

# {{{ default options for cal
alias cal="cal -3m" #}}}

# {{{ list all modules
alias list_modules="/sbin/modprobe --list" #}}}

# {{{ default options for du
alias da="du --total --human-readable --summarize"
alias du="du --human-readable --one-file-system --time --time-style=+'%Y-%m-%d' --total"
#}}}

# {{{ default options for pybugz
if [[ -x /usr/bin/bugz ]]; then
    alias bugz="bugz --user gentoo@rene.in-berlin.de --password iZlK4S2PpV --forget"
    alias buggatt="bugz --view attachment"
    alias buggattsave="bugz attachment"
    alias bugget="bugz --columns 80 get"
    alias bugsearch="bugz search -s ASSIGNED -s NEW -s REOPENED -s UNCONFIRMED -s CONFIRMED --order date"
fi #}}}

# {{{ default options for bc
[[ -x /usr/bin/bc ]] && alias bc="bc --mathlib" #}}}

# {{{ default options for diff-eix
[[ -x /usr/bin/eix-diff ]] && alias eix-diff="eix-diff --care /var/cache/eix.previous /var/cache/eix" #}}}

# {{{ shutdown the system
alias shutdown="sudo shutdown"
alias halt="shutdown -h now"
alias reboot="shutdown -r now"
alias poweroff="shutdown -P now" #}}}

# {{{ power management
alias hibernate="(gnome-screensaver-command --lock || xscreensaver-command -lock); sudo pm-hibernate"
alias suspend-hybrid="(gnome-screensaver-command --lock || xscreensaver-command -lock); sudo pm-suspend-hybrid"
alias suspend="(gnome-screensaver-command --lock || xscreensaver-command -lock); sudo pm-suspend" #}}}

# {{{ default options fpr pdflatex
if [[ -x /usr/bin/pdflatex ]]; then
    alias pdflatex="pdflatex -file-line-error -halt-on-error -recorder"
    alias latex="pdflatex"
fi #}}}

# {{{ alias for using mc
[[ -x /usr/bin/mc ]] && alias mc="mc -S nicedark --subshell" #}}}

# {{{ default options for mp3gain
[[ -x /usr/bin/mp3gain ]] && alias mp3gain="mp3gain --auto -q" #}}}

# {{{ default options for tidy
[[ -x /usr/bin/tidy ]] && alias tidy="tidy -indent -wrap 80 -errors" #}}}

# {{{ default options for grc
if [[ -x /usr/bin/grc ]]; then
    alias grc="grc --stderr --stdout --colour=auto"
    # default options for netstat, ping, traceroute
    [[ -x /bin/netstat ]]        && alias netstat="grc netstat"
    [[ -x /bin/ping ]]           && alias ping="grc ping -c5 -w10"
    [[ -x /bin/ping6 ]]          && alias ping6="grc ping6 -c6 -w10"
    [[ -x /usr/bin/traceroute ]] && alias traceroute="grc traceroute"
else
    # default options for ping/ping6
    [[ -x /bin/ping ]]           && alias ping="ping -c5 -w10"
    [[ -x /bin/ping6 ]]          && alias ping6="ping6 -c5 -w10"
fi #}}}

# {{{ default options for tig
[[ -x /usr/bin/tig ]] && alias tig="tig --all" #}}}

# {{{ default options for lsattr and chattr
[[ -x /usr/bin/lsattr ]] && alias lsattr="lsattr -a"
[[ -x /usr/bin/chattr ]] && alias chattr="chattr -RV" #}}}

# vim:filetype=sh foldmethod=marker textwidth=0
