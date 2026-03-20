{
  flake.homeModules = {
    cli = {
      lib,
      self,
      ...
    }: {
      imports = lib.lists.singleton self.homeModules.archivers;
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
