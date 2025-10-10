let
  inherit (import ../lib/keys.nix) adminKeys nixosKeys desktopKeys laptopKeys serverKeys;
  inherit (builtins) foldl' elem;

  unique = foldl' (acc: e:
    if elem e acc
    then acc
    else acc ++ [e]) [];
in {
  "common/common/github-token.age".publicKeys = adminKeys;
  "nixos/common/tailscale-authkey.age".publicKeys = nixosKeys;

  "nixos/desktop/password.age".publicKeys =
    adminKeys
    ++ desktopKeys
    |> unique;

  "nixos/laptop/password.age".publicKeys =
    adminKeys
    ++ laptopKeys
    |> unique;

  "nixos/server/password.age".publicKeys =
    adminKeys
    ++ serverKeys
    |> unique;
}
