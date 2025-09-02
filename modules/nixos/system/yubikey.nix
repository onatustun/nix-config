{
  lib,
  pkgs,
  username,
  ...
}: let
  inherit (lib) u2fKeys concatStringsSep enabled;
  inherit (pkgs) writeText;

  authfile =
    u2fKeys
    |> concatStringsSep ":"
    |> (s: "${username}:${s}")
    |> writeText "u2f-keys";
in {
  security = {
    polkit = enabled;

    pam = {
      u2f = enabled {
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
        sudo.u2fAuth = true;
      };
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

  programs = {
    ssh.startAgent = false;

    gnupg.agent = enabled {
      enableSSHSupport = true;
      pinentryPackage = pkgs.pinentry-gnome3;
    };
  };

  home-manager.sharedModules = [
    {
      programs.gpg = enabled {
        scdaemonSettings.disable-ccid = true;
      };
    }
  ];

  environment.systemPackages = with pkgs; [
    age-plugin-yubikey
    cryptsetup
    fido2-manage
    pamtester
    pam_u2f
    yubikey-agent
    yubikey-manager
    yubikey-personalization
    yubikey-touch-detector
    yubioath-flutter
  ];
}
