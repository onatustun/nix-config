{
  flake.homeModules.obsidian = {
    lib,
    pkgs,
    ...
  }: {
    home.packages = lib.lists.singleton pkgs.obsidian;
  };
}
