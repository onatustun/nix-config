{
  services = {
    xserver = {
      enable = true;

      displayManager.gdm = {
        enable = true;
        wayland = true;
      };
    };

    displayManager = {
      defaultSession = "hyprland";

      autoLogin = {
        enable = true;
        user = "onat";
      };
    };
  };
}
