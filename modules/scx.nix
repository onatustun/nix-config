{
  flake.nixosModules.scx.services.scx = {
    enable = true;
    scheduler = "scx_rusty";
  };
}
