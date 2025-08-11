{
  lib,
  isDarwin,
  isDroid,
  ...
}: let
  inherit (lib) enabled;
in {
  home-manager.sharedModules = [
    {
      programs.fastfetch = enabled {
        settings = {
          logo.source =
            if isDarwin
            then "macos"
            else if isDroid
            then "android"
            else "nixos";

          display.size = {
            maxPrefix = "MB";
            ndigits = 0;
          };

          modules = [
            "title"
            "os"
            "host"
            "bios"
            "kernel"
            "uptime"
            "packages"
            "cpu"
            "gpu"
            "swap"
            "disk"
            "display"
            "wm"
            "brightness"
            "shell"
            "terminal"
            "colors"
          ];
        };
      };
    }
  ];
}
