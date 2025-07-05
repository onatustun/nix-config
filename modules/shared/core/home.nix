{
  homeDir,
  pkgs,
  username,
  ...
}: {
  home-manager.sharedModules = [
    {
      programs.home-manager.enable = true;

      services = {
        cliphist.enable = true;
        geoclue2.enable = true;
      };

      home = {
        username = username;
        homeDirectory = homeDir;
        sessionVariables.FLAKE = "${homeDir}/nix";

        packages = with pkgs; [
          appimage-run
          bottom
          cliphist
          dconf
          fd
          fzf
          gammastep
          geoclue2
          git
          killall
          less
          nix-search-cli
          nix-search-tv
          p7zip
          playerctl
          polkit
          prettyping
          rar
          ripgrep
          skim
          unzip
          wget
          xdg-user-dirs
          yazi
          zip
          zmkBATx
          zoxide
        ];
      };
    }
  ];
}
