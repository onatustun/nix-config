{
  flake.modules.nixos.chaotic = {
    chaotic,
    type,
    ...
  }: {
    nixpkgs.overlays = [chaotic.overlays.default];
    imports = [chaotic."${type}Modules".default];
  };
}
