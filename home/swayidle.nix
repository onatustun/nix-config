{
  services.swayidle = {
    enable = true;

    events = [
      {
        event = "before-sleep";
        command = "swaylock -defF";
      }
      {
        event = "lock";
        command = "swaylock -defF";
      }
    ];
    timeouts = [
      {
        timeout = 60;
        command = "brightnessctl s 30%-";
        resumeCommand = "brightnessctl -s s 30%+";
      }
      {
        timeout = 300;
        command = "swaylock -defF";
      }
    ];
  };
}
