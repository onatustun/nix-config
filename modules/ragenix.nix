{ moduleWithSystem, ... }:
{
  partitions.dev.module.perSystem =
    { inputs', ... }:
    {
      make-shells.default.packages = [ inputs'.ragenix.packages.default ];
    };

  flake = {
    nixosModules.ragenix =
      { inputs, ... }:
      {
        imports = [ inputs.ragenix.nixosModules.default ];
        nixpkgs.overlays = [ inputs.ragenix.overlays.default ];

        nix.settings = {
          extra-substituters = [ "https://crane.cachix.org" ];
          extra-trusted-public-keys = [ "crane.cachix.org-1:8Scfpmn9w+hGdXH/Q9tTLiYAE/2dnJYRJP7kl80GuRk=" ];
        };

        age.identityPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
        home-manager.sharedModules = [ inputs.self.homeModules.ragenix ];
      };

    homeModules.ragenix = moduleWithSystem (
      { inputs', ... }:
      {
        inputs,
        config,
        pkgs,
        ...
      }:
      {
        imports = [ inputs.ragenix.homeManagerModules.default ];
        age.identityPaths = [ "${config.home.homeDirectory}/.ssh/id_ed25519" ];

        home.packages = [
          inputs'.ragenix.packages.default
          pkgs.rage
        ];
      }
    );
  };
}
