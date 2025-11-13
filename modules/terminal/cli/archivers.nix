{
  flake.modules.homeManager.archivers = {pkgs, ...}: {
    home.packages = [
      pkgs.p7zip
      pkgs.rar
      pkgs.unzip
      pkgs.zip
    ];
  };
}
