{
  flake.nixosModules = {
    hardware = {
      lib,
      inputs,
      ...
    }: {
      imports = lib.lists.singleton inputs.self.nixosModules.graphics;
    };

    graphics.hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };
  };
}
