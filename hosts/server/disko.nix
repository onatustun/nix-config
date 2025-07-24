{lib, ...}: {
  disko.devices.disk.main = {
    type = "disk";

    device = let
      inherit (lib) mkDefault;
    in
      mkDefault "/dev/sda";

    content = {
      type = "gpt";

      partitions = {
        boot = {
          name = "boot";
          size = "1M";
          type = "EF02";
          priority = 1;
        };

        ESP = {
          name = "ESP";
          size = "512M";
          type = "EF00";

          content = {
            type = "filesystem";
            format = "vfat";
            mountpoint = "/boot";
          };
        };

        root = {
          name = "root";
          size = "100%";

          content = {
            type = "filesystem";
            format = "ext4";
            mountpoint = "/";
          };
        };
      };
    };
  };
}
