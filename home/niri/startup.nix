let
  makeCommand = command: {
    command = [command];
  };
in [
  (makeCommand "xwayland-satellite")
  (makeCommand "wl-paste --type image --watch cliphist store")
  (makeCommand "wl-paste --type text --watch cliphist store")
  (makeCommand "niriswitcher")
  (makeCommand "brightness -r")
  (makeCommand "hyprctl setcursor hypr_Bibata-Modern-Ice 24")
]
