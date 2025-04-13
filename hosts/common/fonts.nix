{
  pkgs,
  ...
}: {
  fonts = { 
    fontDir.enable = true;
    fontconfig.enable = true;

    packages = with pkgs; [
      montserrat
      font-awesome
      nerd-fonts.jetbrains-mono
      nerd-fonts.symbols-only
    ];
  };
}
