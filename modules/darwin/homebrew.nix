{
  lib,
  inputs,
  username,
  ...
}: let
  inherit (lib) enabled;
in {
  imports = [inputs.nix-homebrew.darwinModules.nix-homebrew];

  homebrew = enabled {
    casks = [
      "ghostty"
      "orion"
    ];
  };

  nix-homebrew = enabled {
    enableRosetta = true;
    user = "${username}";

    taps = {
      "homebrew/homebrew-core" = inputs.homebrew-core;
      "homebrew/homebrew-cask" = inputs.homebrew-cask;
    };

    autoMigrate = true;
    mutableTaps = false;
  };
}
