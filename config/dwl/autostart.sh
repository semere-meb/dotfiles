dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP XDG_SESSION_TYPE

foot --server &

pgrep -x mako >/dev/null || mako &

swayidle -w \
  timeout 300 'waylock -fork-on-lock -init-color 0x282828 -input-color 0x928374' \
  timeout 600 'wlr-randr --output eDP-1 --off' resume 'wlr-randr --output eDP-1 --on' \
  before-sleep 'waylock -fork-on-lock -init-color 0x282828 -input-color 0x928374' &

wlsunset -l 52.5 -L 13.4 &
