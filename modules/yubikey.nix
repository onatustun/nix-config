{
  flake = {
    nixosModules.yubikey =
      {
        pkgs,
        lib,
        keys,
        username,
        inputs,
        ...
      }:
      let
        inherit (pkgs.writers) writeText;
        inherit (lib.strings) concatStringsSep;
        inherit (lib.attrsets) attrValues;
      in
      {
        security.pam = {
          u2f = {
            enable = true;

            settings = {
              cue = true;
              interactive = true;
              origin = "pam://u2f";
              appid = "pam://u2f";
              authfile = writeText "u2f-keys" ("${username}:" + concatStringsSep ":" keys.u2fKeys);
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

          udev.packages = attrValues {
            inherit (pkgs)
              libfido2
              libu2f-host
              yubikey-personalization
              ;
          };
        };

        environment.systemPackages = attrValues {
          inherit (pkgs)
            age-plugin-yubikey
            cryptsetup
            fido2-manage
            pamtester
            pam_u2f
            yubikey-manager
            yubikey-personalization
            yubioath-flutter
            ;
        };

        programs.yubikey-touch-detector = {
          enable = true;
          libnotify = true;
        };

        home-manager.sharedModules = [ inputs.self.homeModules.yubikey ];
      };

    homeModules.yubikey =
      { lib, pkgs, ... }:
      let
        inherit (lib.meta) getExe;
      in
      {
        home.packages = [ pkgs.yubikey-touch-detector ];

        systemd.user.services.yubikey-touch-detector = {
          Unit = {
            Description = "YubiKey touch detector";
            PartOf = "graphical-session.target";
          };

          Service.ExecStart = getExe pkgs.yubikey-touch-detector;
          Install.WantedBy = [ "graphical-session.target" ];
        };
      };
  };
}
