{
  disko = {
    devices.disk.nvme0n1 = {
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
            };
          };
          
          swap = {
            size = "8G";

            content = {
              type = "swap";
            };
          };
          
          root = {
            size = "100%";

            content = {
              type = "filesystem";
              format = "ext4";
            };
          };
        };
      };
    };
    
    enableConfig = false;
  };
}
