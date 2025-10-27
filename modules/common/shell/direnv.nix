{inputs', ...}: {
  home-manager.sharedModules = [
    {
      programs.direnv = {
        enable = true;
        silent = true;

        nix-direnv = {
          enable = true;
          package = inputs'.nix-direnv.packages.default;
        };
      };
    }
  ];
}
