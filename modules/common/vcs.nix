{
  inputs,
  pkgs,
  ...
}: {
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

        jujutsu = {
          enable = true;
          package = inputs.jujutsu.packages.${pkgs.stdenv.hostPlatform.system}.default;

          settings.user = {
            name = "onatustun";
            email = "o@ust.sh";
          };
        };
      };
    }
  ];
}
