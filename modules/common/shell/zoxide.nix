{lib, ...}: let
  inherit (lib) enabled;
in {
  home-manager.sharedModules = [
    {
      programs.zoxide = enabled {
        enableNushellIntegration = true;
        options = ["--cmd cd"];
      };
    }
  ];
}
