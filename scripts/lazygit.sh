#!/usr/bin/env bash

dir=$(tmux display-message -p '#{pane_current_path}')
cd "$dir"

if ! git rev-parse --git-dir > /dev/null 2>&1; then
  tmux display-message "Not in a git repository"
  exit
fi

tmux display-popup \
  -d "#{pane_current_path}" \
  -w 80% \
  -h 80% \
  -E "lazygit"