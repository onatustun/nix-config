{
  flake.nixosModules = {
    security = {
      lib,
      inputs,
      ...
    }: {
      imports = lib.lists.singleton inputs.self.nixosModules.security-core;
    };

    security-core.security = {
      polkit.enable = true;
      rtkit.enable = true;
    };
  };
}
