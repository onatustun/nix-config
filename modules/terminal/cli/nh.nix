{
  flake.homeModules = {
    cli = {
      lib,
      inputs,
      ...
    }: {
      imports = lib.lists.singleton inputs.self.homeModules.nh;
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
