{username, ...}: {
  services.displayManager = {
    autoLogin = {
      enable = false;
      user = username;
    };

    gdm = {
      enable = true;
      wayland = true;
    };
  };
}
