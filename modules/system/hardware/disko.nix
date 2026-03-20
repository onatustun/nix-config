{moduleWithSystem, ...}: {
  flake.nixosModules.disko = moduleWithSystem ({inputs', ...}: {
    inputs,
    self,
    hostName,
    lib,
    ...
  }: {
    imports = [
      inputs.disko.nixosModules.default
      self.diskoConfigurations.${hostName}
    ];

    environment.systemPackages = lib.lists.singleton inputs'.disko.packages.default;
  });
}
