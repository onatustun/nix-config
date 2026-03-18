{
  flake.modules.nixos = {
    hardware = {
      lib,
      self,
      type,
      ...
    }: {
      imports = lib.lists.singleton self.modules.${type}.graphics;
    };

    graphics.hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };
  };
}
