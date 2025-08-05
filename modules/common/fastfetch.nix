{lib, ...}: {
  home-manager.sharedModules = [
    {
      programs.fastfetch = let
        inherit (lib) enabled;
      in
        enabled {
          settings = {
            logo.source = "nixos";

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
