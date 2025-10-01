{
  inputs,
  pkgs,
  ...
}: {
  home-manager.sharedModules = [
    {
      programs.direnv = {
        enable = true;
        silent = true;

        nix-direnv = {
          enable = true;
          package = inputs.nix-direnv.packages.${pkgs.stdenv.hostPlatform.system}.default;
        };
      };
    }
  ];
}
