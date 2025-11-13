{
  flake.modules.homeManager.direnv = {inputs', ...}: {
    programs.direnv = {
      enable = true;
      silent = true;

      nix-direnv = {
        enable = true;
        package = inputs'.nix-direnv.packages.default;
      };
    };
  };
}
