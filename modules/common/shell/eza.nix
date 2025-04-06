{lib, ...}: let
  inherit (lib) enabled;
in {
  home-manager.sharedModules = [
    {
      programs.eza = enabled {
        colors = "auto";
        git = true;
        icons = "auto";
      };
    }
  ];
}
