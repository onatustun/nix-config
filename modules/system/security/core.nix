{
  flake.nixosModules = {
    security = {
      lib,
      self,
      ...
    }: {
      imports = lib.lists.singleton self.nixosModules.security-core;
    };

    security-core.security = {
      polkit.enable = true;
      rtkit.enable = true;
    };
  };
}
