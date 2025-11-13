{
  flake.modules.homeManager.gh = {pkgs, ...}: {
    home.packages = [pkgs.gh];

    programs.gh = {
      enable = true;
      settings.git_protocol = "ssh";
    };
  };
}
