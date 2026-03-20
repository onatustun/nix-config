let
  keys = import ./lib/_keys.nix;

  unique = builtins.foldl' (acc: e:
    if builtins.elem e acc
    then acc
    else acc ++ [e]) [];
in {
  "modules/system/nix/github-token.age".publicKeys = unique keys.nixosKeys;
  "modules/system/network/tailscale-authkey.age".publicKeys = unique keys.nixosKeys;

  "hosts/desktop/password.age".publicKeys =
    unique (keys.adminKeys
      ++ keys.desktopKeys);

  "hosts/laptop/password.age".publicKeys =
    unique (keys.adminKeys
      ++ keys.laptopKeys);

  "hosts/server/password.age".publicKeys =
    unique (keys.adminKeys
      ++ keys.serverKeys);
}
