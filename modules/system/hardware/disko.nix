{moduleWithSystem, ...}: {
  flake.nixosModules.disko = moduleWithSystem ({inputs', ...}: {
    inputs,
    hostName,
    lib,
    ...
  }: {
    imports = [
      inputs.disko.nixosModules.default
      inputs.self.diskoConfigurations.${hostName}
    ];

    environment.systemPackages = lib.lists.singleton inputs'.disko.packages.default;
  });
}
