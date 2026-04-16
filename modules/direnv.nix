{
  flake.modules.homeManager.direnv.programs.direnv = {
    enable = true;
    silent = true;
    nix-direnv.enable = true;
  };
}
