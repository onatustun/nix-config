{moduleWithSystem, ...}: {
  perSystem = {
    lib,
    inputs',
    ...
  }: {
    make-shells.default.packages = lib.lists.singleton inputs'.ragenix.packages.default;
  };

  flake = {
    nixosModules.ragenix = {
      inputs,
      lib,
      ...
    }: {
      imports = lib.lists.singleton inputs.ragenix.nixosModules.default;
      nixpkgs.overlays = lib.lists.singleton inputs.ragenix.overlays.default;
      age.identityPaths = lib.lists.singleton "/etc/ssh/ssh_host_ed25519_key";
      home-manager.sharedModules = lib.lists.singleton inputs.self.homeModules.ragenix;

      nix.settings = {
        extra-substituters = lib.lists.singleton "https://crane.cachix.org";
        extra-trusted-public-keys = lib.lists.singleton "crane.cachix.org-1:8Scfpmn9w+hGdXH/Q9tTLiYAE/2dnJYRJP7kl80GuRk=";
      };
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
