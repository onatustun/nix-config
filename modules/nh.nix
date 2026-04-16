{
  flake.modules.homeManager.nh =
    { config, ... }:
    {
      home.sessionVariables = {
        NH_FLAKE = config.home.sessionVariables.FLAKE;
        NH_OS_FLAKE = config.home.sessionVariables.NH_FLAKE;
      };

      programs = {
        nushell.environmentVariables = { inherit (config.home.sessionVariables) NH_FLAKE NH_OS_FLAKE; };

        nh = {
          enable = true;

          clean = {
            enable = true;
            extraArgs = "--keep-since 4d --keep 3";
          };
        };
      };
    };
}
