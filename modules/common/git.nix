{
  home-manager.sharedModules = [
    {
      programs = {
        git = {
          enable = true;
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

        lazygit.enable = true;
      };
    }
  ];
}
