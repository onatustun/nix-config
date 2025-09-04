#!/usr/bin/env nu

def set-gaps [g_in: int, g_out: int] {
  hyprctl keyword general:gaps_in $g_in
  hyprctl keyword general:gaps_out $g_out
}

let gapsIn =  hyprctl -j getoption general:gaps_in
  | from json
  | get custom
  | split row " "
  | first
  | into int

match $gapsIn {
  -2 => { set-gaps 8 16 }
  _  => { set-gaps -2 0 }
}

do -i { pkill -SIGUSR1 waybar }