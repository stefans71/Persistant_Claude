#!/bin/bash

# Start Claude Code session for this project

# Get the session name from directory name
SESSION_NAME=$(basename "$(pwd)")

# Get the project path
PROJECT_PATH=$(pwd)

echo "Starting Claude Code session: $SESSION_NAME"
echo "Project path: $PROJECT_PATH"

# Create or attach to tmux session
tmux new-session -A -s "$SESSION_NAME" -c "$PROJECT_PATH" "claude code --resume; bash"