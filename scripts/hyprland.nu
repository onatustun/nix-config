#!/usr/bin/env nu

def set-gaps [g_in: int, g_out: int] {
  hyprctl --batch $"
    keyword general:gaps_in ($g_in);
    keyword general:gaps_out ($g_out)
  "
}

let gaps_in =  hyprctl -j getoption general:gaps_in
  | from json
  | get custom
  | split row " "
  | first
  | into int

if $gaps_in == -2 {
  set-gaps 8 16
} else {
  set-gaps -2 0
}

do -i { pkill -SIGUSR1 waybar }