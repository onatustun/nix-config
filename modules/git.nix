{
  partitions.dev.module.perSystem =
    { pkgs, ... }:
    {
      make-shells.default.packages = [ pkgs.git ];
    };

  flake.homeModules.git =
    { config, ... }:
    {
      programs.git = {
        enable = true;
        lfs.enable = true;

        settings = {
          user = {
            email = "git@onatustun.com";
            name = "onatustun";
          };

          commit.verbose = true;
          init.defaultBranch = "main";
          safe.directory = config.home.sessionVariables.FLAKE;
        };

        ignores = [
          ".direnv"
          ".envrc"
        ];
      };
    };
}
