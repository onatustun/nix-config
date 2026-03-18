{
  flake.modules.homeManager = {
    cli = {
      lib,
      self,
      ...
    }: {
      imports = lib.lists.singleton self.modules.homeManager.zoxide;
    };

    zoxide = {lib, ...}: {
      programs.zoxide = {
        enable = true;
        options = lib.lists.singleton "--cmd cd";
      };
    };
  };
}
