{
  flake.nixosModules.nixpkgs =
    { lib, ... }:
    let
      inherit (lib.trivial) const;
    in
    {
      nixpkgs.config = {
        allowUnfree = true;
        allowBroken = true;
        allowUnfreePredicate = const true;
      };
    };
}
