{
  flake.nixosModules.fonts =
    { lib, pkgs, ... }:
    let
      inherit (lib.attrsets) attrValues;
    in
    {
      fonts = {
        fontDir.enable = true;
        fontconfig.enable = true;

        packages = attrValues {
          inherit (pkgs)
            dejavu_fonts
            font-awesome
            noto-fonts-color-emoji
            ;
          inherit (pkgs.nerd-fonts)
            jetbrains-mono
            symbols-only
            ;
        };
      };
    };
}
