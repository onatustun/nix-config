{
  flake.modules.homeManager.jujutsu = {config, ...}: {
    programs = {
      jujutsu = {
        enable = true;

        settings = {
          inherit (config.programs.git.settings) user;
        };
      };

      jjui.enable = true;
    };
  };
}
