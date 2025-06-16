{mkHost, ...}: {
  flake.nixosConfigurations = {
    laptop = mkHost "laptop" "x86_64-linux" {
      wm = ["hyprland" "niri"];
      shell = "fish";
    } [];

    desktop = mkHost "desktop" "x86_64-linux" {
      wm = "hyprland";
      shell = "fish";
    } [];
  };
}
