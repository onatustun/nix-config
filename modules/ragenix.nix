{moduleWithSystem, ...}: {
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
