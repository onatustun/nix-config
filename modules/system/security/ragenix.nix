{
  flake.modules = {
    nixos = {
      ragenix = {self, ...}: {
        imports = [self.modules.nixos.ragenix'];
        home-manager.sharedModules = [self.modules.homeManager.ragenix];
      };

      ragenix' = {
        ragenix,
        inputs',
        pkgs,
        ...
      }: {
        imports = [ragenix.nixosModules.default];
        age.identityPaths = ["/etc/ssh/ssh_host_ed25519_key"];

        environment.systemPackages = [
          inputs'.ragenix.packages.default
          pkgs.rage
        ];
      };
    };

    homeManager.ragenix = {
      ragenix,
      inputs',
      pkgs,
      ...
    }: {
      imports = [ragenix.homeManagerModules.default];
      age.identityPaths = ["/etc/ssh/ssh_host_ed25519_key"];

      home.packages = [
        inputs'.ragenix.packages.default
        pkgs.rage
      ];
    };
  };
}
