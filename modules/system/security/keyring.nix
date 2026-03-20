{
  flake.nixosModules = {
    security = {
      lib,
      self,
      ...
    }: {
      imports = lib.lists.singleton self.nixosModules.keyring;
    };

    keyring = {
      lib,
      pkgs,
      ...
    }: {
      security.pam.services = {
        gdm-password.enableGnomeKeyring = true;
        login.enableGnomeKeyring = true;
      };

      services = {
        gnome.gnome-keyring.enable = true;
        dbus.packages = lib.lists.singleton pkgs.gnome-keyring;
      };

      programs.seahorse.enable = true;
    };
  };
}
