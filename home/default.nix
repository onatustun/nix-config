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
      discord
      dunst
      fzf
      hyprshot
      hyprsunset
      imv
      mpv
      obs-studio
      obsidian
      obsidian
      pavucontrol
      ripgrep
      tree
      vscode
      wl-clipboard
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
      zoxide
    ];
  };

  programs = {
    home-manager.enable = true;
    zoxide.enable = true;
  };

  systemd.user.startServices = "sd-switch";
}
