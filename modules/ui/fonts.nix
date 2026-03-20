{
  flake.nixosModules = {
    ui = {
      lib,
      self,
      ...
    }: {
      imports = lib.lists.singleton self.nixosModules.fonts;
    };

    fonts = {pkgs, ...}: {
      fonts = {
        fontDir.enable = true;
        fontconfig.enable = true;

        packages = [
          pkgs.dejavu_fonts
          pkgs.font-awesome
          pkgs.nerd-fonts.jetbrains-mono
          pkgs.nerd-fonts.symbols-only
          pkgs.noto-fonts-color-emoji
        ];
      };
    };
  };
}
