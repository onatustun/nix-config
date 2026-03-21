{
  flake.homeModules.archivers = {pkgs, ...}: {
    home.packages = [
      pkgs.p7zip
      pkgs.rar
      pkgs.unzip
      pkgs.zip
    ];
  };
}
