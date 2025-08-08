{
  lib,
  pkgs,
  ...
}: let
  inherit (lib) enabled;
in {
  environment.systemPackages = with pkgs; [
    cliphist
    wl-clipboard
    wl-clip-persist
  ];

  home-manager.sharedModules = [
    {
      services.cliphist = enabled;
    }
  ];
}
