{lib, ...}: {
  flake.modules.homeManager.deadnix = {self', ...}: {
    home.packages = [self'.packages.deadnix];
  };

  perSystem = {inputs', ...}: {
    packages.deadnix =
      inputs'.deadnix.packages.default.overrideAttrs
      (lib.trivial.const {meta.mainProgram = "deadnix";});
  };
}
