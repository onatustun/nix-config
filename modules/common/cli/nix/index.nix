{lib, ...}: let
  inherit (lib) enabled;
in {
  programs.nix-index-database.comma = enabled;
  home-manager.sharedModules = [{programs.nix-index = enabled;}];
}
