{
  flake.modules.homeManager.fastfetch.programs.fastfetch = {
    enable = true;

    settings = {
      logo.source = "none";

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
