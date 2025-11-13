{
  flake.modules.nixos.yubikey = {
    pkgs,
    lib,
    keys,
    username,
    ...
  }: let
    authfile =
      pkgs.writers.writeText "u2f-keys"
      ("${username}:" + lib.strings.concatStringsSep ":" keys.u2fKeys);
  in {
    security.pam = {
      u2f = {
        enable = true;

        settings = {
          cue = true;
          interactive = true;
          control = "sufficient";
          inherit authfile;
          origin = "pam://u2f";
          appid = "pam://u2f";
        };
      };

      services = {
        gdm-password.u2fAuth = true;
        login.u2fAuth = true;
        polkit-1.u2fAuth = true;
        sshd.u2fAuth = true;
        sudo.u2fAuth = true;
        su.u2fAuth = true;
      };
    };

    services = {
      pcscd.enable = true;

      udev.packages = [
        pkgs.libfido2
        pkgs.libu2f-host
        pkgs.yubikey-personalization
      ];
    };

    programs.yubikey-touch-detector = {
      enable = true;
      libnotify = true;
    };

    environment.systemPackages = [
      pkgs.age-plugin-yubikey
      pkgs.cryptsetup
      pkgs.fido2-manage
      pkgs.pamtester
      pkgs.pam_u2f
      pkgs.yubikey-manager
      pkgs.yubikey-personalization
      pkgs.yubikey-touch-detector
      pkgs.yubioath-flutter
    ];
  };
}
