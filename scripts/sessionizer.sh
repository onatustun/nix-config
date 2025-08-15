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

    for dir in "${potential_dirs[@]}"; do
        [[ -d $dir ]] && search_dirs+=("$dir")
    done

    if (( ${#search_dirs[@]} )); then
        selected=$(
            fd --max-depth 1 --type d . "${search_dirs[@]}" |
            sed "s|^$HOME/||" |
            sk --margin 10% --color=bw
        )
        [[ -n $selected ]] && selected=$HOME/$selected
    fi
fi

[[ -z $selected ]] && exit 0

selected_name=$(basename "$selected" | tr . _)

if ! tmux has-session -t="$selected_name" 2>/dev/null; then
    tmux new-session -ds "$selected_name" -c "$selected"
fi

tmux switch-client -t="$selected_name"