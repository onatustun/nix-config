#!/usr/bin/env nu

let gapsIn = hyprctl -j getoption general:gaps_in
    | from json
    | get custom
    | split row ' '
    | first
    | into int

if ($gapsIn == -2) {
    hyprctl keyword general:gaps_in 8
    hyprctl keyword general:gaps_out 8
} else {
    hyprctl keyword general:gaps_in -2
    hyprctl keyword general:gaps_out 0
}

pkill -SIGUSR1 waybar