#!/bin/sh
# Open lazygit on the repository of the pane that invoked the plugin.
# Popup panes have no pane id, so take the cwd from the plugin context JSON.
set -eu

cwd=$(printf '%s' "${HERDR_PLUGIN_CONTEXT_JSON:-}" |
	sed -n 's/.*"focused_pane_cwd":"\([^"]*\)".*/\1/p')

# Falling back to $PWD would silently open this plugin's own repo instead of the user's.
[ -n "$cwd" ] || {
	echo 'lazygit: no pane cwd in HERDR_PLUGIN_CONTEXT_JSON' >&2
	exit 1
}

cd "$cwd"
exec lazygit "$@"
