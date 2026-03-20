{
  flake.nixosModules = {
    hardware = {
      lib,
      inputs,
      ...
    }: {
      imports = lib.lists.singleton inputs.self.nixosModules.audio;
    };

    audio = {pkgs, ...}: {
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
        pkgs.ffmpeg-full
        pkgs.pavucontrol
        pkgs.pipewire
        pkgs.playerctl
        pkgs.pwvucontrol
        pkgs.scdl
        pkgs.wireplumber
        pkgs.yt-dlp
      ];
    };
  };
}
