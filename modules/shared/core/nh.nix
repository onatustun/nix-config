{homeDir, ...}: {
  home-manager.sharedModules = [
    {
      programs.nh = {
        enable = true;
        flake = "${homeDir}/nix";
      };
    }
  ];
}
