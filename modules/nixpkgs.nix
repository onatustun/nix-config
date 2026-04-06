{ inputs, ... }:
let
  config = {
    allowBroken = true;
    allowUnfreePredicate = _: true;
    allowUnfree = true;
  };
in
{
  perSystem =
    { system, ... }:
    {
      _module.args.pkgs = import inputs.nixpkgs { inherit system config; };
    };

  flake = {
    nixosModules.core.nixpkgs = { inherit config; };
    homeModules.home-manager.nixpkgs = { inherit config; };
  };
}
