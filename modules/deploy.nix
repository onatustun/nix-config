{lib, ...}: {
  options.flake.deploy = lib.options.mkOption {
    default = {};

    type = lib.types.submodule {
      options.nodes = lib.options.mkOption {
        default = {};

        type =
          lib.types.lazyAttrsOf
          lib.types.anything;
      };
    };
  };

  config.perSystem = {
    lib,
    inputs',
    ...
  }: {
    make-shells.nix-config.packages = lib.lists.singleton inputs'.deploy-rs.packages.default;
  };
}
