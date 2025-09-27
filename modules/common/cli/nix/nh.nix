{
  inputs,
  pkgs,
  homeDir,
  ...
}: {
  home-manager.sharedModules = [
    {
      programs.nh = {
        enable = true;
        package = inputs.nh.packages.${pkgs.stdenv.hostPlatform.system}.default;
        flake = "${homeDir}/nix";

        clean = {
          enable = true;
          extraArgs = "--keep-since 4d --keep 3";
        };
      };
    }
  ];
}
