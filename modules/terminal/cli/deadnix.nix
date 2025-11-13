{lib, ...}: {
  flake.modules.homeManager.deadnix = {self', ...}: {
    home.packages = [self'.packages.deadnix];
  };

  perSystem = {inputs', ...}: {
    packages.deadnix =
      inputs'.deadnix.packages.default.overrideAttrs
      (lib.const {meta.mainProgram = "deadnix";});
  };
}
