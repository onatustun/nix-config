{lib, ...}: let
  inherit (lib) enabled;
in {
  home-manager.sharedModules = [
    {
      programs.git = enabled {
        lfs = enabled;
        userName = "onatustun";
        userEmail = "o@ust.sh";

        ignores = [
          ".direnv"
          ".envrc"
        ];

        extraConfig = {
          init.defaultBranch = "main";
          safe.directory = "~/nix";
        };
      };
    }
  ];
}
