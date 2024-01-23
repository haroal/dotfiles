#!/usr/bin/env bash

if [ -z "$1" ]; then
	# Display list of folders and let user pick one with fuzzy finding
	ZOXIDE_RESULT=$(zoxide query -l | fzf --reverse)
else
	ZOXIDE_RESULT=$(zoxide query -l | grep "$1\$")
	num_lines=$(echo "${ZOXIDE_RESULT}" | wc -l)
	if [ $num_lines -gt 1 ]; then
		ZOXIDE_RESULT=$(echo "${ZOXIDE_RESULT}" | fzf --reverse)
	fi
fi

if [ -z "${ZOXIDE_RESULT}" ]; then
	# No folder selected/found
	if [ -z "$1" ]; then
		exit 0
	else
		exit 1
	fi
fi

# Session name is higher folder name
FOLDER=$(basename "${ZOXIDE_RESULT}")
# Look for an existing session
SESSION=$(tmux list-sessions 2>/dev/null | grep "${FOLDER}" | cut -d: -f1 | head -n1)
if [ -z "${SESSION}" ]; then
	# No tmux session exists with this name, so create a new one first
	cd "${ZOXIDE_RESULT}"
	tmux new-session -d -s "${FOLDER}"
	SESSION="${FOLDER}"
fi

if [ -z "${TMUX}" ]; then
	# Not in tmux, so we attach a new tmux
	tmux attach -t "${SESSION}"
else
	# Already in a tmux session so just switch to new session
	tmux switch-client -t "${SESSION}"
fi
