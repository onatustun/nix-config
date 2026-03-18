{
  flake.modules.nixos.disko = {
    inputs,
    self,
    hostName,
    inputs',
    ...
  }: {
    imports = [
      inputs.disko.nixosModules.default
      self.diskoConfigurations."${hostName}"
    ];

    environment.systemPackages = [inputs'.disko.packages.default];
  };
}
