{
  perSystem = {
    lib,
    inputs',
    ...
  }: {
    make-shells.default.packages = lib.lists.singleton inputs'.determinate.packages.default;
  };

  flake.nixosModules.determinate = {
    lib,
    inputs,
    config,
    ...
  }: {
    imports = lib.lists.singleton inputs.determinate.nixosModules.default;

    nix.settings = {
      extra-substituters = lib.lists.singleton "https://install.determinate.systems";
      extra-trusted-public-keys = lib.lists.singleton "cache.flakehub.com-3:hJuILl5sVK4iKm86JzgdXW12Y2Hwd5G07qKtHTOcDCM=";
    };

    nix.enable = lib.modules.mkForce config.nixpkgs.hostPlatform.isLinux;
  };
}
