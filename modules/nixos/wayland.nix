{
  lib,
  pkgs,
  ...
}: let
  inherit (lib) enabled;
in {
  home-manager.sharedModules = [
    {
      services.dunst = enabled;
    }
  ];

  environment.systemPackages = with pkgs; [
    grim
    slurp
  ];
}
