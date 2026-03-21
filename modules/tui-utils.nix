{
  flake.homeModules.tui-utils = {
    lib,
    pkgs,
    ...
  }: {
    programs = {
      bottom.enable = true;
      btop.enable = true;
    };

    home.packages = lib.lists.singleton pkgs.scooter;
  };
}
