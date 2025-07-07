{
  homeVer,
  homeDir,
  username,
  ...
}: {
  home-manager.sharedModules = [
    {
      programs.home-manager.enable = true;
      home = {
        username = username;
        homeDirectory = homeDir;
        sessionVariables.FLAKE = "${homeDir}/nix";
      };
    }
  ];

  home-manager.users.${username}.home.stateVersion = homeVer;
}
