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
  homebrew = enabled;

  nix-homebrew = enabled {
    user = "${username}";

    taps = {
      "homebrew/homebrew-bundle" = inputs.homebrew-bundle;
      "homebrew/homebrew-cask" = inputs.homebrew-cask;
      "homebrew/homebrew-core" = inputs.homebrew-core;
    };

    autoMigrate = true;
    mutableTaps = false;
  };
}
