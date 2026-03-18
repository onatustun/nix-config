{self, ...}: {
  flake.modules = {
    nixos = {
      security = {
        lib,
        self,
        type,
        ...
      }: {
        imports = lib.lists.singleton self.modules.${type}.ragenix;
      };

      ragenix = {
        lib,
        inputs,
        type,
        inputs',
        pkgs,
        self,
        ...
      }: {
        nixpkgs.overlays = lib.lists.singleton inputs.ragenix.overlays.default;
        imports = lib.lists.singleton inputs.ragenix."${type}Modules".default;
        age.identityPaths = ["/etc/ssh/ssh_host_ed25519_key"];

        environment.systemPackages = [
          inputs'.ragenix.packages.default
          pkgs.rage
        ];

        home-manager.sharedModules = lib.lists.singleton self.modules.homeManager.ragenix;
      };
    };

    darwin = {
      inherit (self.modules.nixos) ragenix;
    };

    homeManager.ragenix = {
      lib,
      inputs,
      config,
      inputs',
      pkgs,
      ...
    }: {
      imports = lib.lists.singleton inputs.ragenix.homeManagerModules.default;
      age.identityPaths = lib.lists.singleton "${config.home.homeDirectory}/.ssh/id_ed25519";

      home.packages = [
        inputs'.ragenix.packages.default
        pkgs.rage
      ];
    };
  };
}
