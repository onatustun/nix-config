{
  flake.modules.nixos = {
    security = {
      lib,
      self,
      type,
      ...
    }: {
      imports = lib.lists.singleton self.modules.${type}.security-core;
    };

    security-core.security = {
      polkit.enable = true;
      rtkit.enable = true;
    };
  };
}
