let
  keys = import ./lib/_keys.nix;
in {
  "modules/system/nix/github-token.age".publicKeys = keys.allKeys;
  "modules/system/network/tailscale-authkey.age".publicKeys = keys.allKeys;
  "hosts/desktop/password.age".publicKeys = keys.allKeys;
  "hosts/laptop/password.age".publicKeys = keys.allKeys;
}
