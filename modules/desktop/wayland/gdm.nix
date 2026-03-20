{
  flake.nixosModules = {
    wayland = {
      lib,
      self,
      ...
    }: {
      imports = lib.lists.singleton self.nixosModules.gdm;
    };

    gdm.services.displayManager.gdm = {
      enable = true;
      wayland = true;
    };
  };
}
