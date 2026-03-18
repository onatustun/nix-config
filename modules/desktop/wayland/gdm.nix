{
  flake.modules.nixos = {
    wayland = {
      lib,
      self,
      type,
      ...
    }: {
      imports = lib.lists.singleton self.modules.${type}.gdm;
    };

    gdm.services.displayManager.gdm = {
      enable = true;
      wayland = true;
    };
  };
}
