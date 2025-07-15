{pkgs, ...}: {
  home-manager.sharedModules = [
    {
      services.dunst.enable = true;
    }
  ];

  environment.systemPackages = with pkgs; [
    calibre
    dunst
    grim
    imv
    mpv
    slurp
    zathura
  ];
}
