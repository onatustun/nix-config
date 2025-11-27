{
  inputs,
  config,
  ...
}: {
  imports = [
    inputs.flake-parts.flakeModules.modules
    inputs.home-manager.flakeModules.home-manager
  ];

  flake = {
    darwinModules = config.flake.modules.darwin;
    homeModules = config.flake.modules.homeManager;
    nixosModules = config.flake.modules.nixos;
  };
}
