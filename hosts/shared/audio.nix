{
  pkgs,
  ... 
}: {
  security.rtkit.enable = true;

  services = {
    pulseaudio.enable = false;

    pipewire = {
      enable = true;
      jack.enable = true;
      pulse.enable = true;
      wireplumber.enable = true;

      alsa = {
        enable = true;
        support32Bit = true;
      };
    };
  };

  environment.systemPackages = [
    pkgs.pavucontrol
  ];
}
