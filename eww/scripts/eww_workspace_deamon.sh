#!/usr/bin/env sh

LOCKFILE="/tmp/workspace-daemon.lock"

if [ -e "$LOCKFILE" ] && kill -0 "$(cat $LOCKFILE)" 2>/dev/null; then
    echo "Daemon already running"
    exit
fi

echo $$ > "$LOCKFILE"

trap 'rm -f "$LOCKFILE"' EXIT


while true; do
	ws=$(hyprctl activeworkspace | grep 'workspace ID' | head -n1 | awk '{print $3}')
    eww update workspace="$ws"
    sleep 0.5
done
