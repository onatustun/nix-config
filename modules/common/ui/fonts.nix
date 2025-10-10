{
  lib,
  pkgs,
  ...
}: let
  inherit (lib) concatLists;
in {
  fonts.packages = with pkgs;
    concatLists [
      [
        dejavu_fonts
        font-awesome
        noto-fonts-emoji
      ]

      (with nerd-fonts; [
        jetbrains-mono
        symbols-only
      ])
    ];
}
