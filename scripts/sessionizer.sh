#!/usr/bin/env bash

if [[ $# -eq 1 ]]; then
    selected=$1
else
    search_dirs=()
    potential_dirs=(
        "$HOME"
        "$HOME/Documents/code/git"
        "$HOME/Documents/code"
    )

    for dir in "''${potential_dirs[@]}"; do
        if [[ -d "$dir" ]]; then
            search_dirs+=("$dir")
        fi
    done

    if [[ ''${#search_dirs[@]} -gt 0 ]]; then
        selected=$(fd --max-depth 1 --type d . "''${search_dirs[@]}" | \
            sed "s|^$HOME/||" | \
            sk --margin 10% --color="bw"
        )
        if [[ -n "$selected" ]]; then
            selected="$HOME/$selected"
        fi
    fi
fi

if [[ -z $selected ]]; then
    exit 0
fi

selected_name=$(basename "$selected" | tr . _)

if ! tmux has-session -t=$selected_name 2> /dev/null; then
    tmux new-session -ds $selected_name -c $selected
fi

tmux switch-client -t $selected_name