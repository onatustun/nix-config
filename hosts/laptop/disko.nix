{
  disko.devices.disk.nvme0n1 = {
    device = "/dev/nvme0n1";
    type = "disk";

    content = {
      type = "gpt";

      partitions = {
        boot = {
          size = "1M";
          type = "EF02";
        };
        
        ESP = {
          size = "512M";
          type = "EF00";

          content = {
            type = "filesystem";
            format = "vfat";
            mountpoint = "/boot";
          };
        };
        
        swap = {
          size = "8G";

          content = {
            type = "swap";
            resumeDevice = true;
          };
        };
        
        root = {
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
