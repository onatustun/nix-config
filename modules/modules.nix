{ inputs, ... }:
{
  imports = [ inputs.flake-parts.flakeModules.modules ];

  flake =
    { config, ... }:
    {
      homeModules = config.modules.homeManager;
      nixosModules = config.modules.nixos;
    };
}
