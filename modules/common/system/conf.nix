{
  lib,
  secretsDir,
  isDarwin,
  inputs,
  config,
  ...
}: let
  inherit (lib) mkDefault optionalAttrs optionals;
in {
  age.secrets."github-token" = {
    file = "${secretsDir}/common/common/github-token.age";
    owner = "root";
    group = "root";
    mode = "0400";
  };

  nix = {
    channel.enable = false;

    gc =
      {
        automatic = !isDarwin;
        options = "--delete-older-than 3d";
      }
      // optionalAttrs (!isDarwin) {
        dates = "weekly";
        persistent = true;
      };

    nixPath = ["nixpkgs=flake:nixpkgs"];
    optimise.automatic = !isDarwin;
    registry.nixpkgs.flake = inputs.nixpkgs;

    extraOptions = ''
      !include ${config.age.secrets."github-token".path}
    '';

    settings =
      {
        auto-optimise-store = true;
        builders-use-substitutes = true;
        cores = mkDefault 0;

        experimental-features =
          [
            "flakes"
            "nix-command"
            "pipe-operators"
          ]
          ++ optionals (!isDarwin) ["cgroups"];

        flake-registry = "";
        http-connections = 50;
        lazy-trees = true;
        max-jobs = mkDefault "auto";
        show-trace = true;

        trusted-users =
          [
            "@build"
            "@wheel"
            "root"
          ]
          ++ optionals isDarwin ["@admin"];

        warn-dirty = false;
        keep-derivations = true;
        keep-outputs = true;
      }
      // optionalAttrs (!isDarwin) {use-cgroups = true;};
  };
}
