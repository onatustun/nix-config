{
  services.displayManager = {
    autoLogin = {
      enable = false;
      user = "onat";
    };

    gdm = {
      enable = true;
      wayland = true;
    };
  };
}
