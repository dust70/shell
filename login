# {{{ load SSH and GPG keys
[[ ${SHLVL} -eq 1  ]] && [[ -x /usr/bin/keychain ]] && \
    keychain --quiet --timeout 10080 \
        keys/id_rsa.{bitbucket,git{,hub},stauzebach.git}
#}}}

# {{{ unburden homw
[[ ${SHLVL} -eq 1 ]] && [[ -x /usr/bin/unburden-home-dir ]] && \
    unburden-home-dir
#}}}

# vim: filetype=sh foldmethod=marker textwidth=80
