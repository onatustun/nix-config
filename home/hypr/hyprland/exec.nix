{
  isLaptop,
  ...
}: {
  exec-once = [
    "wl-paste --type image --watch cliphist store"
    "wl-paste --type text --watch cliphist store"
    "brightnessctl -r"
  ] ++ (if isLaptop then [
    "sleep 5 && zmkbatx"
  ] else[
  ]);
}
