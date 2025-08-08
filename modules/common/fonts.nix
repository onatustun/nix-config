{
  lib,
  pkgs,
  ...
}: let
  inherit (lib) enabled;
in {
  fonts = {
    fontDir = enabled;
    fontconfig = enabled;

    packages = with pkgs; [
      font-awesome
      nerd-fonts.symbols-only
    ];
  };
}
