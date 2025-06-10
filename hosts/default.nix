{
  mkHost,
  ...
}: {
  flake.nixosConfigurations = {
    laptop = mkHost "laptop" "x86_64-linux" [];
    desktop = mkHost "desktop" "x86_64-linux" [];
  };
}
