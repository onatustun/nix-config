{ 
  mkHosts,
  ... 
}: {
  flake.nixosConfigurations = mkHosts {
    laptop = "x86_64-linux" [];
  };
}
