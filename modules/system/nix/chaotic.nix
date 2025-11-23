{
  flake.modules.nixos.chaotic = {
    chaotic,
    type,
    ...
  }: {
    nix.settings = {
      extra-substituters = ["https://chaotic-nyx.cachix.org"];
      extra-trusted-public-keys = ["chaotic-nyx.cachix.org-1:HfnXSw4pj95iI/n17rIDy40agHj12WfF+Gqk6SonIT8="];
    };

    nixpkgs.overlays = [chaotic.overlays.default];
    imports = [chaotic."${type}Modules".default];
  };
}
