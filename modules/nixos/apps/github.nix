{
  lib,
  pkgs,
  ...
}: let
  inherit (lib) enabled;
in {
  environment.systemPackages = with pkgs; [
    gh
    github-desktop
  ];

  home-manager.sharedModules = [{programs.gh = enabled {settings.git_protocol = "ssh";};}];
}
