{
  lib,
  inputs,
  username,
  ...
}: let
  inherit (lib) enabled;
in {
  imports = [inputs.nix-homebrew.darwinModules.nix-homebrew];
  system.primaryUser = "${username}";

  homebrew = enabled {
    casks = [
      "ghostty"
      "karabiner-elements"
      "orion"
    ];
  };

  nix-homebrew = enabled {
    user = "${username}";

    taps = {
      "homebrew/homebrew-core" = inputs.homebrew-core;
      "homebrew/homebrew-cask" = inputs.homebrew-cask;
    };

    autoMigrate = true;
    mutableTaps = false;
  };
}
