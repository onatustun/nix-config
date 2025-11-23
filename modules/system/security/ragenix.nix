{self, ...}: {
  flake.modules = {
    nixos = {
      ragenix = {
        self,
        type,
        ...
      }: {
        imports = [self.modules.${type}.ragenix'];
        home-manager.sharedModules = [self.modules.homeManager.ragenix];
      };

      ragenix' = {
        ragenix,
        type,
        inputs',
        pkgs,
        ...
      }: {
        nixpkgs.overlays = [ragenix.overlays.default];
        imports = [ragenix."${type}Modules".default];
        age.identityPaths = ["/etc/ssh/ssh_host_ed25519_key"];

        environment.systemPackages = [
          inputs'.ragenix.packages.default
          pkgs.rage
        ];
      };
    };

    darwin = {inherit (self.modules.nixos) ragenix ragenix';};

    homeManager.ragenix = {
      ragenix,
      homeDir,
      inputs',
      pkgs,
      ...
    }: {
      imports = [ragenix.homeManagerModules.default];
      age.identityPaths = ["${homeDir}/.ssh/id_ed25519"];

      home.packages = [
        inputs'.ragenix.packages.default
        pkgs.rage
      ];
    };
  };
}
