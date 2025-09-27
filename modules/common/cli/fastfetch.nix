{
  isDarwin,
  isWsl,
  ...
}: {
  home-manager.sharedModules = [
    {
      programs.fastfetch = {
        enable = true;

        settings = {
          logo.source =
            if isDarwin
            then "macos"
            else if isWsl
            then "window 11"
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
