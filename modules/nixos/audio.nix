{
  lib,
  pkgs,
  ...
}: let
  inherit (lib) enabled;
in {
  security.rtkit.enable = true;

  services = {
    pulseaudio.enable = false;

    pipewire = enabled {
      alsa = enabled {support32Bit = true;};
      jack.enable = true;
      pulse.enable = true;
      wireplumber.enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    pavucontrol
    pipewire
    playerctl
    pwvucontrol
    wireplumber
  ];
}
