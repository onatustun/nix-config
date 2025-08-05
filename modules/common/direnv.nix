{lib, ...}: {
  home-manager.sharedModules = [
    {
      programs.direnv = let
        inherit (lib) enabled;
      in
        enabled {
          nix-direnv.enable = true;
          silent = true;
        };
    }
  ];
}
