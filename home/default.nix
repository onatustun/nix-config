{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./modules
    inputs.nvf.homeManagerModules.default
  ];

  home = {
    username = "onat";
    homeDirectory = "/home/onat";
    stateVersion = "24.11";

    packages = with pkgs; [
      bat
      brightnessctl
      btop
      dunst
      fzf
      hyprshot
      hyprsunset
      obsidian
      pavucontrol
      ripgrep
      tree
      wl-clipboard
      xdg-desktop-portal-hyprland
      zoxide
    ];
  };
}
