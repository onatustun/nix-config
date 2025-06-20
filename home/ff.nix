{isLaptop, ...}: {
  programs.fastfetch = {
    enable = true;

    settings = {
      logo.source = "nixos";

      display.size = {
        maxPrefix = "MB";
        ndigits = 0;
      };

      modules =
        [
          "title"
          "os"
          "host"
          "bios"
          "kernel"
          "uptime"
          "packages"
          "cpu"
        ]
        ++ (
          if !isLaptop
          then [
            "gpu"
          ]
          else []
        )
        ++ [
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
