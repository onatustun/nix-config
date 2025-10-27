{
  inputs',
  homeDir,
  ...
}: {
  home-manager.sharedModules = [
    {
      programs.nh = {
        enable = true;
        package = inputs'.nh.packages.default;
        flake = "${homeDir}/nix";

        clean = {
          enable = true;
          extraArgs = "--keep-since 4d --keep 3";
        };
      };
    }
  ];
}
