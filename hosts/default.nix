{
  mkHost,
  ...
}: {
  flake.nixosConfigurations = {
    laptop = mkHost "laptop" "x86_64-linux" [];
  };
}
