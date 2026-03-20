{
  flake.homeModules = {
    cli = {
      lib,
      inputs,
      ...
    }: {
      imports = lib.lists.singleton inputs.self.homeModules.archivers;
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
