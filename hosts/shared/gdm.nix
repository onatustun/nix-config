{wm, ...}: {
  services = {
    xserver = {
      enable = true;

      displayManager.gdm = {
        enable = true;
        wayland = true;
      };
    };

    displayManager = {
      defaultSession = wm;

      autoLogin = {
        enable = true;
        user = "onat";
      };
    };
  };
}
