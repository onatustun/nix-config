{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    cliphist
    wl-clipboard
    wl-clip-persist
  ];

  home-manager.sharedModules = [
    {
      services.cliphist.enable = true;
    }
  ];
}
