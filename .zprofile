if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  exec Hyprland > /dev/null 2>&1
fi

# SSH
eval "$(keychain --eval id_rsa)"
