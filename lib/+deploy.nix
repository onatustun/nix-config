let
  opt = {lib, ...}: {
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
  };
in {
  imports = [opt];
  flake.flakeModules.deploy-rs = opt;
}
