let
  keys = import ../lib/keys.nix;

  unique = builtins.foldl' (acc: e:
    if builtins.elem e acc
    then acc
    else acc ++ [e]) [];
in {
  "common/common/github-token.age".publicKeys = keys.adminKeys;
  "nixos/common/tailscale-authkey.age".publicKeys = keys.nixosKeys;

  "nixos/desktop/password.age".publicKeys =
    unique (keys.adminKeys
      ++ keys.desktopKeys);

  "nixos/laptop/password.age".publicKeys =
    unique (keys.adminKeys
      ++ keys.laptopKeys);

  "nixos/server/password.age".publicKeys =
    unique (keys.adminKeys
      ++ keys.serverKeys);
}
