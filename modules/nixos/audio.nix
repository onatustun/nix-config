{
  lib,
  pkgs,
  ...
}: {
  security.rtkit.enable = true;

  services = {
    pulseaudio.enable = false;

    pipewire = let
      inherit (lib) enabled;
    in
      enabled {
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
