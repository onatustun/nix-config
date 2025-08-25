let
  inherit (import ./keys.nix) allKeys;
in {
  "secrets/tailscale-authkey.age".publicKeys = allKeys;
}
