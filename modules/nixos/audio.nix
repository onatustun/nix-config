{
  lib,
  pkgs,
  ...
}: let
  inherit (lib) enabled disabled;
in {
  security.rtkit = enabled;

  services = {
    pulseaudio = disabled;

    pipewire = enabled {
      alsa = enabled {support32Bit = true;};
      jack = enabled;
      pulse = enabled;
      wireplumber = enabled;
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
