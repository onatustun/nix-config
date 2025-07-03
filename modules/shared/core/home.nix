{
  homeDir,
  pkgs,
  username,
  ...
}: {
  home-manager.sharedModules = [
    {
      services.cliphist.enable = true;
      programs.home-manager.enable = true;

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
