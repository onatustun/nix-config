let
  keys = import ./keys.nix;
in {
  "secrets/tailscale-authkey.age".publicKeys = keys.hostKeys + keys.userKeys;
}
