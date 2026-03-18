{
  flake.modules.homeManager = {
    cli = {
      lib,
      self,
      ...
    }: {
      imports = lib.lists.singleton self.modules.homeManager.nh;
    };

    nh = {config, ...}: {
      programs.nh = {
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
