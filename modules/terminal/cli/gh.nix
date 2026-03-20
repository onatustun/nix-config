{
  flake.homeModules = {
    cli = {
      lib,
      inputs,
      ...
    }: {
      imports = lib.lists.singleton inputs.self.homeModules.gh;
    };

    gh.programs.gh = {
      enable = true;
      settings.git_protocol = "ssh";
    };
  };
}
