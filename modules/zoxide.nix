{
  flake.homeModules.zoxide = {lib, ...}: {
    programs.zoxide = {
      enable = true;
      options = lib.lists.singleton "--cmd cd";
    };
  };
}
