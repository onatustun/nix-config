{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    gh
    github-desktop
  ];

  home-manager.sharedModules = [
    {
      programs.gh = {
        enable = true;
        settings.git_protocol = "ssh";
      };
    }
  ];
}
