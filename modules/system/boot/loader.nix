{
  flake.modules.nixos = {
    boot = {
      lib,
      self,
      type,
      ...
    }: {
      imports = lib.lists.singleton self.modules.${type}.loader;
    };

    loader = {isServer, ...}: {
      boot = {
        consoleLogLevel =
          if isServer
          then 4
          else 0;

        initrd.verbose = false;
        plymouth.enable = !isServer;
        tmp.cleanOnBoot = true;

        loader = {
          efi.canTouchEfiVariables = !isServer;
          timeout = 3;

          grub = {
            enable = true;
            efiSupport = true;
            device = "nodev";
            useOSProber = !isServer;
          };
        };
      };
    };
  };
}
