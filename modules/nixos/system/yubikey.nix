{
  lib,
  pkgs,
  ...
}: let
  inherit (lib) enabled;
in {
  environment.etc."u2f-keys" = {
    text = "onat:JLXDGTk3Ga2sRBz1cCrARjYbPySed5ZGDVX+T70NBePnAAZsxeAiK0Cl4cBXUjZ+3mx/bicbocJdYBf1WpHClw==,XuyXJU85C9ytixnVMBrx5jRuEujpkQJGxW/dS9ZlhjUXzgKw1q4xivdAaN9eFP9WKmDm0RyGo/t3EtxD4wvq0w==,es256,+presence:lzcAIIfjWzUj3lXxYfCmKDMBJ3QnajAS1bjlqyNP3ece+oN75482SS5vXyPDpK1fBF0+qgzRz3BF8wuC1IUwTQ==,JzQBz79Mg9/uVf5r5J9IsrBDOgSI9hbzaEl2qWnfhSAagT+NVbpibGNRguVMtUjbfzo/jGb20xkJy1r87yelGg==,es256,+presence";
    mode = "0644";
  };

  security = {
    polkit = enabled;

    pam = {
      u2f = enabled {
        settings = {
          cue = true;
          interactive = true;
          control = "sufficient";
          authfile = "/etc/u2f-keys";
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
