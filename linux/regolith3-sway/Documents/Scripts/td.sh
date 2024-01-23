#!/usr/bin/env bash

if [ $# -gt 0 ]; then
	echo "No argument expected"
	exit 1
fi

if [ -z "$TMUX" ]; then
	echo "Not in tmux session"
	exit 1
fi

# Get current session base name
SESSION_NAME=$(tmux display-message -p '#S')
SESSION_BASE_NAME=$(echo "${SESSION_NAME}" | cut -d/ -f1)

# Check if other sessions from the same group are available (not to create a new one)
OTHER_AVAILABLE_SESSIONS=$(tmux list-sessions 2>/dev/null | grep "(group ${SESSION_BASE_NAME})" | grep -v "attached")
if [ -z "$OTHER_AVAILABLE_SESSIONS" ]; then
	# No other sesssion available, create a new one
	new_session_num=1
	new_session_name="${SESSION_BASE_NAME}"
	while [ -n "$(tmux list-sessions 2>/dev/null | grep -E "^${new_session_name}:")" ]; do
		new_session_num=$((new_session_num + 1))
		new_session_name="${SESSION_BASE_NAME}/${new_session_num}"
	done

	# Create new session in the same group as the current one
	tmux new -t "${SESSION_BASE_NAME}" -s "${new_session_name}" -d
else
	# Attach to the first available session
	new_session_name=$(echo "${OTHER_AVAILABLE_SESSIONS}" | head -n1 | cut -d: -f1)
fi

# Open new alacritty terminal in background and attach to the tmux session
alacritty --hold -e fish -c "tmux attach -t '${new_session_name}'" &
