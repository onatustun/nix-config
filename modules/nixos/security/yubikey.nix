{
  lib,
  pkgs,
  username,
  ...
}: let
  inherit (lib) u2fKeys concatStringsSep;
  inherit (pkgs) writeText;

  authfile =
    u2fKeys
    |> concatStringsSep ":"
    |> (s: "${username}:${s}")
    |> writeText "u2f-keys";
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

    udev.packages = with pkgs; [
      libfido2
      libu2f-host
      yubikey-personalization
    ];
  };

  programs.yubikey-touch-detector = {
    enable = true;
    libnotify = true;
  };

  environment.systemPackages = with pkgs; [
    age-plugin-yubikey
    cryptsetup
    fido2-manage
    pamtester
    pam_u2f
    yubikey-manager
    yubikey-personalization
    yubikey-touch-detector
    yubioath-flutter
  ];
}
