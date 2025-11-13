{lib, ...}: {
  flake.modules.homeManager.scooter = {self', ...}: {
    home.packages = [self'.packages.scooter];
  };

  perSystem = {inputs', ...}: {
    packages.scooter =
      inputs'.scooter.packages.default.overrideAttrs
      (lib.trivial.const {meta.mainProgram = "scooter";});
  };
}
