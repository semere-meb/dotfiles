export PATH="$PATH:/home/ser/.local/bin"
# export XDG_DATA_DIRS=/usr/local/share:/usr/share

battery.sh &
exec dwl

# if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
#   exec startx > /dev/null 2>&1
# fi

