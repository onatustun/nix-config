{
  isLaptop,
  lib,
  pkgs,
  inputs,
  ...
}: {
  imports =
    [
      inputs.stylix.homeModules.stylix
      ./helix.nix
      ./pointer.nix
      ./stylix.nix
      ./rofi.nix
      ./waybar.nix
      ./wlogout.nix
      ./xdg.nix
    ]
    ++ lib.optional isLaptop ./niri.nix;

  home = {
    username = "onat";
    stateVersion = "24.11";
    homeDirectory =
      if pkgs.stdenv.isLinux
      then "/home/onat"
      else "/Users/onat";

    sessionVariables = {
      EDITOR = "hx";
      VISUAL = "hx";
    };
  };

  programs.home-manager.enable = true;
}
