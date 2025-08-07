{lib, ...}: let
  inherit (lib) enabled;
in {
  home-manager.sharedModules = [
    {
      programs.eza = enabled {
        enableFishIntegration = true;
        colors = "auto";
        git = true;
        icons = "auto";
      };
    }
  ];
}
