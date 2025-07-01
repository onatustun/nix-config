{mkNixos, ...}: {
  flake.nixosConfigurations = {
    laptop = mkNixos "laptop" "x86_64-linux";
    desktop = mkNixos "desktop" "x86_64-linux";
  };
}
