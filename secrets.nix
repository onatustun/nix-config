let
  inherit (import ./keys.nix) allKeys;
in
{
  "modules/nix/github-token.age".publicKeys = allKeys;
  "modules/hosts/desktop/password.age".publicKeys = allKeys;
  "modules/hosts/laptop/password.age".publicKeys = allKeys;
  "modules/tailscale/authkey.age".publicKeys = allKeys;
}
