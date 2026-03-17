{self, ...}: {
  flake.modules = {
    nixos.ragenix = {
      inputs,
      type,
      inputs',
      pkgs,
      self,
      ...
    }: {
      nixpkgs.overlays = [inputs.ragenix.overlays.default];
      imports = [inputs.ragenix."${type}Modules".default];
      age.identityPaths = ["/etc/ssh/ssh_host_ed25519_key"];

      environment.systemPackages = [
        inputs'.ragenix.packages.default
        pkgs.rage
      ];

      home-manager.sharedModules = [self.modules.homeManager.ragenix];
    };

    darwin = {inherit (self.modules.nixos) ragenix;};

    homeManager.ragenix = {
      inputs,
      homeDir,
      inputs',
      pkgs,
      ...
    }: {
      imports = [inputs.ragenix.homeManagerModules.default];
      age.identityPaths = ["${homeDir}/.ssh/id_ed25519"];

      home.packages = [
        inputs'.ragenix.packages.default
        pkgs.rage
      ];
    };
  };
}
