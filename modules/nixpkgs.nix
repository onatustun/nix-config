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
    nixos.core =
      { lib, ... }:
      let
        inherit (lib.modules) mkDefault;
      in
      {
        nixpkgs = { inherit config; };
        system.stateVersion = mkDefault lib.trivial.release;
      };

    homeManager.home-manager =
      { lib, ... }:
      let
        inherit (lib.modules) mkDefault;
      in
      {
        nixpkgs = { inherit config; };
        home.stateVersion = mkDefault lib.trivial.release;
      };
  };
}
