{
  flake.nixosModules = {
    wayland = {
      lib,
      inputs,
      ...
    }: {
      imports = lib.lists.singleton inputs.self.nixosModules.gdm;
    };

    gdm.services.displayManager.gdm = {
      enable = true;
      wayland = true;
    };
  };
}
