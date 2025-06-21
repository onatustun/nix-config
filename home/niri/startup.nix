let
  makeCommand = command: {
    command = [command];
  };
in [
  (makeCommand "xwayland-satellite")
  (makeCommand "swayidle")
  (makeCommand "wl-paste --type image --watch cliphist store")
  (makeCommand "wl-paste --type text --watch cliphist store")
  (makeCommand "wl-clip-persist --clipboard both")
  (makeCommand "brightness -r")
]
