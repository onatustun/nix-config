{pkgs, ...}: {
  security.pam.services = {
    gdm-password.enableGnomeKeyring = true;
    login.enableGnomeKeyring = true;
  };

  services = {
    gnome = {
      gcr-ssh-agent.enable = true;
      gnome-keyring.enable = true;
    };

    dbus.packages = with pkgs; [
      gcr
      gnome-keyring
    ];
  };

  programs.seahorse.enable = true;
}
