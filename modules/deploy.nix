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

  config.perSystem = {inputs', ...}: {
    make-shells.default.packages = [inputs'.deploy-rs.packages.default];
  };
}
