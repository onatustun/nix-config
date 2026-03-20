{
  flake.nixosModules = {
    boot = {
      lib,
      inputs,
      ...
    }: {
      imports = lib.lists.singleton inputs.self.nixosModules.scx;
    };

    scx.services.scx = {
      enable = true;
      scheduler = "scx_rusty";
    };
  };
}
