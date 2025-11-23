{
  flake.modules.nixos.disko = {
    disko,
    self,
    hostName,
    inputs',
    ...
  }: {
    imports = [
      disko.nixosModules.default
      self.diskoConfigurations."${hostName}"
    ];

    environment.systemPackages = [inputs'.disko.packages.default];
  };
}
