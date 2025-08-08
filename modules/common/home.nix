{
  lib,
  username,
  homeDir,
  ...
}: let
  inherit (lib) enabled;
in {
  home-manager.sharedModules = [
    {
      programs.home-manager = enabled;

      home = {
        username = username;
        homeDirectory = homeDir;
        sessionVariables.FLAKE = "${homeDir}/nix";
      };
    }
  ];
}
