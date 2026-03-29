let
  inherit ((import ./modules/keys.nix)._module.args) keys;
in
{
  "modules/github-token.age".publicKeys = keys.allKeys;
  "modules/hosts/desktop/password.age".publicKeys = keys.allKeys;
  "modules/hosts/laptop/password.age".publicKeys = keys.allKeys;
  "modules/tailscale/authkey.age".publicKeys = keys.allKeys;
}
