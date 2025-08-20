let
  inherit (import ./keys.nix) all;
in {
  "hosts/nixos/server/hostkey.age".publicKeys = all;
}
