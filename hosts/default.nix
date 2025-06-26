{mkNixos, ...}: {
  flake.nixosConfigurations = {
    laptop = mkNixos "laptop" "x86_64-linux" [
      ../modules/ghostty.nix
      ../modules/brave.nix
      ../modules/gdm.nix
      ../modules/graphics.nix
      ../modules/hyprland.nix
      ../modules/niris.nix
      ../modules/swayidle.nix
      ../modules/swaylock.nix
      ../modules/xwayland.nix
    ];
    desktop = mkNixos "desktop" "x86_64-linux" [
      ../modules/ghostty.nix
      ../modules/brave.nix
      ../modules/gdm.nix
      ../modules/graphics.nix
      ../modules/hyprland.nix
      ../modules/swaylock.nix
      ../modules/xwayland.nix
    ];
  };
}
