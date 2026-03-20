{
  flake.nixosModules = {
    hardware = {
      lib,
      self,
      ...
    }: {
      imports = lib.lists.singleton self.nixosModules.graphics;
    };

    graphics.hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };
  };
}
