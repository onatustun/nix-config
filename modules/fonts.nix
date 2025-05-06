{
  pkgs,
  ...
}: {
  fonts = { 
    fontDir.enable = true;
    fontconfig.enable = true;

    packages = with pkgs; [
      font-awesome
      nerd-fonts.symbols-only
    ];
  };
}
