{
  flake.modules.homeManager = {
    cli = {
      lib,
      self,
      ...
    }: {
      imports = lib.lists.singleton self.modules.homeManager.gh;
    };

    gh.programs.gh = {
      enable = true;
      settings.git_protocol = "ssh";
    };
  };
}
