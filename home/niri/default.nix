{
  config,
  isLaptop,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./misc.nix
    ./ricing.nix
    ./rules.nix
  ];

  systemd.user.services.xwayland-satellite.Install.WantedBy = ["niri.service"];

  xdg.portal = {
    extraPortals = [pkgs.xdg-desktop-portal-gtk];
    configPackages = [pkgs.niri-unstable];
  };

  home.packages = with pkgs; [
    gnome-keyring
    xdg-desktop-portal-gnome
    xdg-desktop-portal-gtk
  ];

  programs.niri.settings = {
    binds = import ./binds.nix {inherit config pkgs;};
    environment = import ./env.nix {inherit isLaptop lib;};
    outputs = import ./outputs.nix {inherit config;};
    spawn-at-startup = import ./startup.nix;
  };
}
