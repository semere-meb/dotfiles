if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  exec Hyprland > /dev/null 2>&1
fi

export GPG_TTY=$(tty)

eval "$(keychain --quiet --eval id_rsa 451054EEC0D2AFD1741D4E6A7FC937214DF30488)"
