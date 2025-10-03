{
  home-manager.sharedModules = [
    {
      programs.git = {
        enable = true;
        userName = "onatustun";
        userEmail = "git@onatustun.com";
        lfs.enable = true;

        ignores = [
          ".direnv"
          ".envrc"
        ];

        extraConfig = {
          init.defaultBranch = "master";
          commit.verbose = true;
          safe.directory = "~/nix";
        };
      };
    }
  ];
}
