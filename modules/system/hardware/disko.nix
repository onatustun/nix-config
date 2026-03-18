{
  flake.modules.nixos.disko = {
    inputs,
    self,
    hostName,
    lib,
    inputs',
    ...
  }: {
    imports = [
      inputs.disko.nixosModules.default
      self.diskoConfigurations.${hostName}
    ];

    environment.systemPackages = lib.lists.singleton inputs'.disko.packages.default;
  };
}
