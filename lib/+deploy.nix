let
  opt = {lib, ...}: {
    options.flake.deploy = lib.mkOption {
      default = {};

      type = lib.types.submodule {
        options.nodes = lib.mkOption {
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
