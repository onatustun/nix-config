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

  flake.modules = {
    nixos.core.nixpkgs = { inherit config; };
    homeManager.home-manager.nixpkgs = { inherit config; };
  };
}
