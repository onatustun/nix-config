{
  lib,
  pkgs,
  ...
}: {
  services.tumbler.enable = true;

  programs.thunar = let
    inherit (lib) enabled;
  in
    enabled {
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
