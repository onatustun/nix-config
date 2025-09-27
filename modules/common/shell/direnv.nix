{
  inputs,
  pkgs,
  ...
}: {
  home-manager.sharedModules = [
    {
      programs.direnv = {
        enable = true;
        package = inputs.direnv.packages.${pkgs.stdenv.hostPlatform.system}.default;
        silent = true;

        nix-direnv = {
          enable = true;
          package = inputs.nix-direnv.packages.${pkgs.stdenv.hostPlatform.system}.default;
        };
      };
    }
  ];
}
