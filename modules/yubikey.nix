{
  flake.nixosModules.yubikey =
    { lib, pkgs, ... }:
    let
      inherit (lib.attrsets) attrValues;
    in
    {
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

      environment.systemPackages = attrValues {
        inherit (pkgs)
          age-plugin-yubikey
          cryptsetup
          fido2-manage
          yubikey-manager
          yubikey-personalization
          yubioath-flutter
          ;
      };
    };
}
