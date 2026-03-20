{
  flake.nixosModules = {
    nix = {
      lib,
      inputs,
      ...
    }: {
      imports = lib.lists.singleton inputs.self.nixosModules.chaotic;
    };

    chaotic = {
      lib,
      inputs,
      ...
    }: {
      nix.settings = {
        extra-substituters = lib.lists.singleton "https://chaotic-nyx.cachix.org";
        extra-trusted-public-keys = lib.lists.singleton "chaotic-nyx.cachix.org-1:HfnXSw4pj95iI/n17rIDy40agHj12WfF+Gqk6SonIT8=";
      };

      nixpkgs.overlays = lib.lists.singleton inputs.chaotic.overlays.default;
      imports = lib.lists.singleton inputs.chaotic.nixosModules.default;
    };
  };
}
