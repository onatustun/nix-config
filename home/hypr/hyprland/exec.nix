{
  isLaptop,
  lib,
  ...
}: {
  exec-once = [
    "wl-paste --type image --watch cliphist store"
    "wl-paste --type text --watch cliphist store"
    "brightnessctl -r"
  ] ++ lib.optional isLaptop "sleep 5 && zmkbatx";
}