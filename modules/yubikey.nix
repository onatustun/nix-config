{
  flake = {
    nixosModules.yubikey =
      {
        pkgs,
        lib,
        username,
        keys,
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
              authfile = writeText "u2f-keys" "${username}:${concatStringsSep ":" keys.u2fKeys}";
            };
          };

          services = {
            gdm-password.u2fAuth = false;
            login.u2fAuth = false;
            polkit-1.u2fAuth = false;
            sshd.u2fAuth = false;
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
      };
  };
}
