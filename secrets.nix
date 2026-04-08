let
  inherit (import ./keys.nix) hostKeys;
in
{
  "modules/nix/github-token.age".publicKeys = hostKeys;
  "modules/hosts/desktop/password.age".publicKeys = hostKeys;
  "modules/hosts/laptop/password.age".publicKeys = hostKeys;
  "modules/tailscale/authkey.age".publicKeys = hostKeys;
}
