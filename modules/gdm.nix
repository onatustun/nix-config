{
  services = {
    xserver = {
      enable = true;

      displayManager.gdm = {
        enable = true;
        wayland = true;
      };
    };

    displayManager.autoLogin = {
      enable = false;
      user = "onat";
    };
  };
}
