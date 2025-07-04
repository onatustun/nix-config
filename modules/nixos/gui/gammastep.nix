{
  services.geoclue2.enable = true;

  home-manager.sharedModules = [
    {
      services.gammastep = {
        enable = true;
        provider = "geoclue2";
        tray = true;
      };
    }
  ];
}
