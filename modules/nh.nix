{
  flake.homeModules.nh =
    { config, ... }:
    {
      home.sessionVariables = {
        NH_FLAKE = config.programs.nh.flake;
        NH_OS_FLAKE = config.programs.nh.flake;
      };

      programs = {
        nushell.environmentVariables = {
          inherit (config.home.sessionVariables)
            NH_FLAKE
            NH_OS_FLAKE
            ;
        };

        nh = {
          enable = true;
          flake = "${config.home.homeDirectory}/nix";

          clean = {
            enable = true;
            extraArgs = "--keep-since 4d --keep 3";
          };
        };
      };
    };
}
