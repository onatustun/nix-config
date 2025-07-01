{
  inputs,
  mkNixos,
  profiles,
  ...
}: let
  inherit (inputs) self;
in {
  flake.nixosConfigurations = {
    laptop = mkNixos "laptop" "x86_64-linux" (
      profiles.apps
      ++ profiles.cli
      ++ profiles.core
      ++ profiles.gui
      ++ profiles.hardware
      ++ [
        (self + /modules/niris.nix)
        (self + /modules/swayidle.nix)
        (self + /modules/packages.nix)
      ]
    );
    desktop = mkNixos "desktop" "x86_64-linux" (
      profiles.core
      ++ profiles.cli
      ++ profiles.apps
      ++ profiles.gui
      ++ profiles.hardware
      ++ [
        (self + /modules/packages.nix)
      ]
    );
  };
}
