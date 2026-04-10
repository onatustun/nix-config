let
  inherit (import ./keys.nix) hostKeys;
in
{
  "modules/nix/github-token.age".publicKeys = hostKeys;
  "modules/tailscale/authkey.age".publicKeys = hostKeys;
}
