{pkgs, ...}: {
  home-manager.sharedModules = [
    {
      programs.zed-editor = {
        enable = true;
        installRemoteServer = true;
      };
    }
  ];
}
