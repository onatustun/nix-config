{pkgs, ...}: {
  fonts.packages = with pkgs;
    [
      dejavu_fonts
      font-awesome
      noto-fonts-emoji
    ]
    ++ (with nerd-fonts; [
      jetbrains-mono
      symbols-only
    ]);
}
