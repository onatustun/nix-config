let
  keys = import ../lib/_keys.nix;

  unique = builtins.foldl' (acc: e:
    if builtins.elem e acc
    then acc
    else acc ++ [e]) [];
in {
  "common/common/github-token.age".publicKeys = unique keys.nixosKeys;
  "nixos/common/tailscale-authkey.age".publicKeys = unique keys.nixosKeys;

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
