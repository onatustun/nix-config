{
  flake.modules.nixos.nix-core = {
    determinate,
    type,
    secretsDir,
    username,
    config,
    nixpkgs,
    lib,
    ...
  }: {
    imports = [determinate."${type}Modules".default];

    age.secrets."github-token" = {
      file = "${secretsDir}/common/common/github-token.age";
      owner = "root";
      group = "root";
      mode = "0400";
    };

    nix = {
      enable = config.nixpkgs.hostPlatform.isLinux;
      channel.enable = false;

      gc = {
        automatic = !config.home-manager.users.${username}.programs.nh.clean.enable;
        options = "--delete-older-than 3d";
      };

      optimise.automatic = true;
      nixPath = ["nixpkgs=flake:nixpkgs"];
      registry.nixpkgs.flake = nixpkgs;

      extraOptions = ''
        !include ${config.age.secrets.github-token.path}
      '';

      settings = {
        auto-optimise-store = true;
        builders-use-substitutes = true;
        cores = lib.modules.mkDefault 0;

        extra-substituters = [
          "https://nix-community.cachix.org"
          "https://nix-darwin.cachix.org"
        ];

        extra-trusted-public-keys = [
          "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
          "nix-darwin.cachix.org-1:LxMyKzQk7Uqkc1Pfq5uhm9GSn07xkERpy+7cpwc006A="
        ];

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
