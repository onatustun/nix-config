{
  flake.homeModules = {
    cli = {
      lib,
      inputs,
      ...
    }: {
      imports = lib.lists.singleton inputs.self.homeModules.zoxide;
    };

    zoxide = {lib, ...}: {
      programs.zoxide = {
        enable = true;
        options = lib.lists.singleton "--cmd cd";
      };
    };
  };
}
