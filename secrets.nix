let inherit (import ./keys.nix) nixos-desktop; in {"modules/nixos/system/tailscale-key.age".publicKeys = [nixos-desktop];}
