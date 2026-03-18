{
  flake.modules.homeManager = {
    cli = {
      lib,
      self,
      ...
    }: {
      imports = lib.lists.singleton self.modules.homeManager.git;
    };

    git.programs.git = {
      enable = true;
      lfs.enable = true;

      settings = {
        user = {
          email = "git@onatustun.com";
          name = "onatustun";
        };

        commit.verbose = true;
        init.defaultBranch = "main";
        safe.directory = "~/nix";
      };

      ignores = [
        ".direnv"
        ".envrc"
      ];
    };
  };
}
