{inputs, ...}: {
  imports = [inputs.flake-parts.flakeModules.easyOverlay];

  perSystem = {
    config,
    pkgs,
    lib,
    ...
  }: {
    overlayAttrs = config.packages;

    packages = {
      bibata-hyprcursor = pkgs.callPackage ./bibata-hyprcursor {};
    };
  };
}
