{
  flake.homeModules = {
    cli = {
      lib,
      self,
      ...
    }: {
      imports = lib.lists.singleton self.homeModules.gh;
    };

    gh.programs.gh = {
      enable = true;
      settings.git_protocol = "ssh";
    };
  };
}
