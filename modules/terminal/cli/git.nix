{
  flake.modules.homeManager.git.programs.git = {
    enable = true;
    lfs.enable = true;

    settings = {
      user = {
        email = "git@onatustun.com";
        name = "onatustun";
      };

      commit.verbose = true;
      init.defaultBranch = "master";
      safe.directory = "~/nix";
    };

    ignores = [
      ".direnv"
      ".envrc"
    ];
  };
}
