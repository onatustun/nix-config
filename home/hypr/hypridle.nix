{
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd="pidof hyprlock || hyprlock";
      };

      listener = [
        { 
          on-resume="brightnessctl -r";
          on-timeout="brightnessctl -s set 10";
          timeout=240;
        }

        {
          on-resume="brightnessctl -rd";
          on-timeout="brightnessctl -sd";
          timeout=300;
        }

        {
          on-timeout="loginctl lock-session";
          timeout=360;
        }

        {
          on-resume="hyprctl dispatch dpms on";
          on-timeout="hyprctl dispatch dpms off";
          timeout=420;
        }
      ];
    };
  };
}
