{
  flake.nixosModules.nix-core = {
    lib,
    inputs,
    username,
    config,
    ...
  }: {
    age.secrets."github-token" = {
      file = ./github-token.age;
      owner = "root";
      group = "root";
      mode = "0400";
    };

    nix = {
      enable = lib.modules.mkDefault true;
      channel.enable = false;

      gc = {
        automatic = !config.home-manager.users.${username}.programs.nh.clean.enable;
        options = "--delete-older-than 3d";
      };

      optimise.automatic = true;
      nixPath = lib.lists.singleton "nixpkgs=flake:nixpkgs";
      registry.nixpkgs.flake = inputs.nixpkgs;

      extraOptions = ''
        !include ${config.age.secrets.github-token.path}
      '';

      settings = {
        auto-optimise-store = true;
        builders-use-substitutes = true;
        cores = lib.modules.mkDefault 0;

        extra-substituters = lib.lists.singleton "https://nix-community.cachix.org";
        extra-trusted-public-keys = lib.lists.singleton "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs=";

        experimental-features = [
          "flakes"
          "nix-command"
          "cgroups"
        ];

        flake-registry = "";
        http-connections = 50;
        lazy-trees = true;
        max-jobs = lib.modules.mkDefault "auto";
        show-trace = true;

        trusted-users = [
          "@build"
          "@wheel"
          "root"
          "@admin"
        ];

        warn-dirty = false;
        keep-derivations = true;
        keep-outputs = true;
        use-cgroups = true;
      };
    };
  };
}
