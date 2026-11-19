#!/bin/bash

set -u

exec 9>"${XDG_RUNTIME_DIR:-/tmp}/hypr-keyboard-layout.lock"
flock -n 9 || exit 0

notify() {
	notify-send \
		-t 1500 \
		-h string:x-canonical-private-synchronous:keyboard-layout \
		"Keyboard layout" "$1"
}

set_layout() {
	local layout=$1
	local variant=$2
	local result

	result=$(hyprctl eval "hl.config({ input = { kb_layout = '$layout', kb_variant = '$variant' } })" 2>&1)
	[[ "$result" == "ok" ]] || return 1

	[[ $(hyprctl getoption input:kb_layout -j | jq -r '.str') == "$layout" ]] \
		&& [[ $(hyprctl getoption input:kb_variant -j | jq -r '.str') == "$variant" ]]
}

current_layout=$(hyprctl getoption input:kb_layout -j | jq -r '.str')

if [[ "$current_layout" == "se" ]]; then
	# Configure AltGr International before starting keyd, so keyd never runs
	# while Hyprland is configured with the Swedish layout.
	if ! set_layout us altgr-intl; then
		notify "Could not switch to US AltGr International"
		exit 1
	fi

	if ! systemctl start keyd.service; then
		notify "US AltGr International enabled, but keyd could not be started"
		exit 1
	fi

	notify "Switched to US AltGr International (keyd on)"
else
	# Stop keyd first, so it is never active with the Swedish layout.
	if ! systemctl stop keyd.service; then
		notify "Could not stop keyd; layout was not changed"
		exit 1
	fi

	if ! set_layout se ""; then
		# Restore keyd if changing the layout unexpectedly fails.
		systemctl start keyd.service
		notify "Could not switch to Swedish"
		exit 1
	fi

	notify "Switched to Swedish (keyd off)"
fi
