{
  flake.modules.nixos = {
    boot = {
      lib,
      self,
      type,
      ...
    }: {
      imports = lib.lists.singleton self.modules.${type}.scx;
    };

    scx.services.scx = {
      enable = true;
      scheduler = "scx_rusty";
    };
  };
}
