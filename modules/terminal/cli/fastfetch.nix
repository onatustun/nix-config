{
  flake.modules.homeManager = {
    cli = {
      lib,
      self,
      ...
    }: {
      imports = lib.lists.singleton self.modules.homeManager.fastfetch;
    };

    fastfetch.programs.fastfetch = {
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
  };
}
