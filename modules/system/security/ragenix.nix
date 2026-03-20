{moduleWithSystem, ...}: {
  flake = {
    nixosModules = {
      security = {
        lib,
        self,
        ...
      }: {
        imports = lib.lists.singleton self.nixosModules.ragenix;
      };

      ragenix = moduleWithSystem ({inputs', ...}: {
        lib,
        inputs,
        pkgs,
        self,
        ...
      }: {
        nixpkgs.overlays = lib.lists.singleton inputs.ragenix.overlays.default;
        imports = lib.lists.singleton inputs.ragenix.nixosModules.default;
        age.identityPaths = ["/etc/ssh/ssh_host_ed25519_key"];

        environment.systemPackages = [
          inputs'.ragenix.packages.default
          pkgs.rage
        ];

        home-manager.sharedModules = lib.lists.singleton self.homeModules.ragenix;
      });
    };

    homeModules.ragenix = moduleWithSystem ({inputs', ...}: {
      lib,
      inputs,
      config,
      pkgs,
      ...
    }: {
      imports = lib.lists.singleton inputs.ragenix.homeManagerModules.default;
      age.identityPaths = lib.lists.singleton "${config.home.homeDirectory}/.ssh/id_ed25519";

      home.packages = [
        inputs'.ragenix.packages.default
        pkgs.rage
      ];
    });
  };
}
