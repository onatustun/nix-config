{lib, ...}: {
  home-manager.sharedModules = [
    {
      programs.eza = let
        inherit (lib) enabled;
      in
        enabled {
          enableFishIntegration = true;
          colors = "auto";
          git = true;
          icons = "auto";
        };
    }
  ];
}
