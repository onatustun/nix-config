{
  services.hypridle = {
    enable = true;

    settings = {
      general = {
        lock_cmd="pidof hyprlock || hyprlock";
        before_sleep_cmd = "loginctl lock-session";
        after_sleep_cmd = "hyprctl dispatch dpms on";
      };

      listener = [
        { 
          timeout=180;
          on-timeout="brightnessctl s 30";
          on-resume="brightnessctl s 255";
        }

        {
          timeout=300;
          on-timeout="hyprlock";
        }

        {
          timeout=420;
          on-timeout="hyprctl dispatch dpms off";
          on-resume="hyprctl dispatch dpms on";
        }
      ];
    };
  };
}
