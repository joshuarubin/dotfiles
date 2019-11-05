if [ "$TERM" != dumb ]; then
  GRC=$commands[grc]
fi

if [ -n "$GRC" ]; then
  _colourify_cmds=(
      'as' 'blkid' 'cc' 'configure' 'cvs' 'df' 'diff' 'dig' 'docker'
      'docker-machine' 'du' 'env' 'free' 'g++' 'gas' 'gcc' 'gmake' 'head'
      'ifconfig' 'ip' 'iptables' 'iwconfig' 'last' 'ld' 'ldap' 'lsblk' 'lspci'
      'make' 'mount' 'mtr' 'netstat' 'ping' 'ping6' 'ps' 'semanage' 'setsebool'
      'tail' 'traceroute' 'traceroute6' 'wdiff' 'whois'
  )

  for _cmd in "${_colourify_cmds[@]}"; do
    if (( ${+commands[${_cmd}]} )); then
      eval "
        function ${_cmd} {
          $GRC -es --colour=auto '${commands[${_cmd}]}' \"\$@\"
        }
      "
    fi
  done

  unset _colourify_cmds
fi

unset GRC
