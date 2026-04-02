{
  flake.nixosModules.loader =
    { pkgs, ... }:
    {
      boot = {
        consoleLogLevel = 0;
        plymouth.enable = true;
        tmp.cleanOnBoot = true;

        initrd = {
          systemd.enable = true;
          verbose = false;
        };

        loader = {
          efi.canTouchEfiVariables = true;
          systemd-boot.enable = true;
          timeout = 3;
        };
      };

      environment.systemPackages = [ pkgs.efibootmgr ];
    };
}
