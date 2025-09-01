{
  lib,
  pkgs,
  ...
}: let
  inherit (lib) enabled;
in {
  environment.systemPackages = with pkgs; [
    gnome-keyring
    pamtester
    pam_u2f
    yubikey-manager
    yubikey-personalization
    yubioath-flutter
  ];

  programs = {
    seahorse = enabled;
    gnupg.agent = enabled {enableSSHSupport = true;};
  };

  security.pam.services.login.enableGnomeKeyring = true;

  services = {
    gnome.gnome-keyring = enabled;
    dbus.packages = [pkgs.gnome-keyring];
  };
}
