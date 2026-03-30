#!/usr/bin/env bash
set -euo pipefail

STEP=5

notify() {
    local vol muted
    muted=$(pamixer --get-mute)
    vol=$(pamixer --get-volume)

    if [[ "$muted" == "true" ]]; then
        notify-send -a volume -t 1000 "🔇 Muted"
    else
        notify-send -a volume -t 1000 "🔊 Volume: ${vol}%"
    fi
}

case "${1:-}" in
    up)
        pamixer --increase "$STEP"
        notify
        ;;
    down)
        pamixer --decrease "$STEP"
        notify
        ;;
    mute)
        pamixer --toggle-mute
        notify
        ;;
    *)
        echo "usage: volume {up|down|mute}" >&2
        exit 1
        ;;
esac
