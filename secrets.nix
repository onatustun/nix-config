let
  inherit (import ./keys.nix) adminKeys serverKeys;
in {
  "secrets/tailscale-authkey.age".publicKeys =
    adminKeys
    ++ serverKeys;
}
