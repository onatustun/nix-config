{pkgs, ...}: {
  home-manager.sharedModules = [
    {
      services.dunst.enable = true;
    }
  ];

  environment.systemPackages = with pkgs; [
    grim
    slurp
  ];
}
