{homeDir, ...}: {
  home-manager.sharedModules = [
    {
      home.sessionVariables.FLAKE = "${homeDir}/nix";
    }
  ];
}
