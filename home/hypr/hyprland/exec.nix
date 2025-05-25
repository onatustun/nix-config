{
  exec-once = [
    "wl-paste --type image --watch cliphist store"
    "wl-paste --type text --watch cliphist store"
    "sleep 5 && zmkbatx"
    "brightnessctl -r"
    "hyprsunset -t 3000"
  ];
}
