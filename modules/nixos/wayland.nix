{pkgs, ...}: {
  home-manager.sharedModules = [
    {
      services.dunst.enable = true;
    }
  ];

  environment.systemPackages = with pkgs; [
    dunst
    grim
    imv
    mpv
    slurp
    zathura
  ];
}
