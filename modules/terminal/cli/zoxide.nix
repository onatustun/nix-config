{
  flake.homeModules = {
    cli = {
      lib,
      self,
      ...
    }: {
      imports = lib.lists.singleton self.homeModules.zoxide;
    };

    zoxide = {lib, ...}: {
      programs.zoxide = {
        enable = true;
        options = lib.lists.singleton "--cmd cd";
      };
    };
  };
}
