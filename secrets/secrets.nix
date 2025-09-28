let
  inherit (import ../lib/keys.nix) adminKeys nixosKeys desktopKeys laptopKeys serverKeys;
in {
  "common/common/github-token.age".publicKeys = adminKeys;
  "nixos/common/tailscale-authkey.age".publicKeys = nixosKeys;

  "nixos/desktop/password.age".publicKeys =
    adminKeys
    ++ desktopKeys;

  "nixos/laptop/password.age".publicKeys =
    adminKeys
    ++ laptopKeys;

  "nixos/server/password.age".publicKeys =
    adminKeys
    ++ serverKeys;
}
