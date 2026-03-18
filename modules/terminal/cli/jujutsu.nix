{
  flake.modules.homeManager = {
    cli = {
      lib,
      self,
      ...
    }: {
      imports = lib.lists.singleton self.modules.homeManager.jujutsu;
    };

    jujutsu = {config, ...}: {
      programs = {
        difftastic.enable = true;
        jjui.enable = true;
        mergiraf.enable = true;

        jujutsu = {
          enable = true;

          settings = {
            inherit (config.programs.git.settings) user;

            ui.diff-formatter = [
              "difft"
              "--color"
              "always"
              "$left"
              "$right"
            ];
          };
        };
      };
    };
  };
}
