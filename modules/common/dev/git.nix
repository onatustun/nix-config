{lib, ...}: let
  inherit (lib) enabled;
in {
  home-manager.sharedModules = [
    {
      programs.git = enabled {
        userName = "onatustun";
        userEmail = "git@onatustun.com";
        lfs = enabled;

        ignores = [
          ".direnv"
          ".envrc"
        ];

        extraConfig = {
          init.defaultBranch = "main";
          commit.verbose = true;
          safe.directory = "~/nix";
        };
      };
    }
  ];
}
