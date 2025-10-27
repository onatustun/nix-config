{
  inputs',
  pkgs,
  ...
}: {
  environment.systemPackages = [
    inputs'.lazygit.packages.default
    pkgs.gh
    pkgs.github-desktop
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
