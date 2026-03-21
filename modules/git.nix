{
  flake.homeModules.git.programs.git = {
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
}
