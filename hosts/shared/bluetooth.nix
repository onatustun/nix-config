{
  isLaptop,
  ...
}: {
  hardware.bluetooth = {
    enable = isLaptop;
    powerOnBoot = isLaptop;
  };

  services.blueman.enable = isLaptop;
}
