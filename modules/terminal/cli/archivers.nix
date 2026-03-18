{
  flake.modules.homeManager = {
    cli = {
      lib,
      self,
      ...
    }: {
      imports = lib.lists.singleton self.modules.homeManager.archivers;
    };

    archivers = {pkgs, ...}: {
      home.packages = [
        pkgs.p7zip
        pkgs.rar
        pkgs.unzip
        pkgs.zip
      ];
    };
  };
}
