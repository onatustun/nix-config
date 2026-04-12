{
  flake.nixosModules.fonts =
    { pkgs, ... }:
    {
      fonts = {
        fontDir.enable = true;
        fontconfig.enable = true;

        packages = [
          pkgs.font-awesome
          pkgs.nerd-fonts.symbols-only
        ];
      };
    };
}
