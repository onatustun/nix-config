{
  inputs,
  username,
  ...
}: {
  imports = [inputs.nix-homebrew.darwinModules.nix-homebrew];
  system.primaryUser = "${username}";
  homebrew.enable = true;

  nix-homebrew = {
    enable = true;
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
