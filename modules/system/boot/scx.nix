{
  flake.nixosModules = {
    boot = {
      lib,
      self,
      ...
    }: {
      imports = lib.lists.singleton self.nixosModules.scx;
    };

    scx.services.scx = {
      enable = true;
      scheduler = "scx_rusty";
    };
  };
}
