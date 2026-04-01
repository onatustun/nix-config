{
  flake.nixosModules.nix =
    {
      lib,
      inputs,
      username,
      config,
      ...
    }:
    let
      inherit (lib.lists) singleton;
      inherit (lib.modules) mkDefault;
    in
    {
      age.secrets."github-token" = {
        file = ./github-token.age;
        owner = "root";
        group = "root";
        mode = "0400";
      };

      nix = {
        channel.enable = false;

        gc = {
          automatic = !config.home-manager.users.${username}.programs.nh.clean.enable;
          options = "--delete-older-than 3d";
        };

        optimise.automatic = true;
        nixPath = [ "nixpkgs=flake:nixpkgs" ];
        registry.nixpkgs.flake = inputs.nixpkgs;
        extraOptions = "!include ${config.age.secrets.github-token.path}";

        settings = {
          auto-optimise-store = true;
          builders-use-substitutes = true;
          extra-substituters = [ "https://nix-community.cachix.org" ];
          extra-trusted-public-keys = singleton "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs=";

          experimental-features = [
            "flakes"
            "nix-command"
            "cgroups"
          ];

          flake-registry = "";
          http-connections = 50;
          max-jobs = mkDefault "auto";
          show-trace = true;

          trusted-users = [
            "@build"
            "@wheel"
            "root"
          ];

          warn-dirty = false;
          keep-derivations = true;
          keep-outputs = true;
          use-cgroups = true;
        };
      };
    };
}
