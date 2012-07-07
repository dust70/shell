# {{{ Clean up directory - remove well known tempfiles
purge() {
    emulate -L zsh
    setopt HIST_SUBST_PATTERN
    local -a TEXTEMPFILES GHCTEMPFILES PYTEMPFILES FILES
    TEXTEMPFILES=(*.tex(N:s/%tex/'(log|toc|aux|nav|snm|out|tex.backup|bbl|blg|bib.backup|vrb|lof|lot|hd|idx)(N)'/))
    GHCTEMPFILES=(*.(hs|lhs)(N:r:s/%/'.(hi|hc|(p|u|s)_(o|hi))(N)'/))
    PYTEMPFILES=(*.py(N:s/%py/'(pyc|pyo)(N)'/))
    LONELY_MOOD_FILES=((*.mood)(NDe:'local -a AF;AF=( ${${REPLY#.}%mood}(mp3|flac|ogg|asf|wmv|aac)(N) ); [[ -z "$AF" ]]':))
    FILES=(*~(.N) \#*\#(.N) *.o(.N) a.out(.N) (*.|)core(.N) *.cmo(.N) *.cmi(.N) .*.swp(.N) *.(orig|rej)(.DN) *.dpkg-(old|dist|new)(DN) ._(cfg|mrg)[0-9][0-9][0-9][0-9]_*(N) ${~TEXTEMPFILES} ${~GHCTEMPFILES} ${~PYTEMPFILES} ${LONELY_MOOD_FILES})
    local NBFILES=${#FILES}
    local CURDIRSUDO=""
    [[ ! -w ./ ]] && CURDIRSUDO=$SUDO
    if [[ $NBFILES > 0 ]]; then
        print -l $FILES
        local ans
        echo -n "Remove these files? [y/n] "
        read -q ans
        if [[ $ans == "y" ]]; then
            $CURDIRSUDO rm ${FILES}
            echo ">> $PWD purged, $NBFILES files removed"
        else
            echo "Ok. .. then not.."
        fi
    fi
}
#}}}

# vim:filetype=sh textwidth=80 foldmethod=marker
