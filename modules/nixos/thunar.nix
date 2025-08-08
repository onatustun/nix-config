{
  lib,
  pkgs,
  ...
}: let
  inherit (lib) enabled;
in {
  services.tumbler = enabled;

  programs.thunar = enabled {
    plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-media-tags-plugin
      thunar-volman
    ];
  };

  environment.systemPackages = with pkgs; [
    kdePackages.ark
    ffmpegthumbnailer
    libgsf
    xfce.tumbler
  ];
}
