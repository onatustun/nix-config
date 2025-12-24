{
  flake.modules.homeManager = {
    steel = {self, ...}: {
      imports = [
        self.modules.homeManager.navigator
        self.modules.homeManager.scooter
        self.modules.homeManager.smooth-scroll
        self.modules.homeManager.steel'
      ];
    };

    steel' = {
      inputs',
      config,
      pkgs,
      homeDir,
      lib,
      ...
    }: let
      package =
        inputs'.helix.packages.default.overrideAttrs
        (prevAttrs: {
          cargoBuildFeatures =
            prevAttrs.cargoBuildFeatures or []
            ++ ["steel"];
        });
    in {
      xdg.configFile = {
        "helix/helix.scm".source = config.lib.file.mkOutOfStoreSymlink "${homeDir}/nix/modules/terminal/tui/helix/steel/helix.scm";
        "helix/init.scm".source = config.lib.file.mkOutOfStoreSymlink "${homeDir}/nix/modules/terminal/tui/helix/steel/init.scm";
      };

      home = {
        packages = [pkgs.steel];
        sessionVariables.EDITOR = lib.modules.mkForce (lib.meta.getExe' package "hx");
      };

      programs.helix = {
        package = lib.modules.mkForce package;

        languages = {
          language = [
            {
              name = "scheme";
              language-servers = ["steel-language-server"];
            }
          ];

          language-server.steel-language-server.command = "${lib.meta.getExe' pkgs.steel "steel-language-server"}";
        };
      };
    };
  };
}
