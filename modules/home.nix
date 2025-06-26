{
  isLaptop,
  lib,
  ...
}: {
  imports =
    [
      ./helix.nix
      ./pointer.nix
      ./stylix.nix
      ./rofi.nix
      ./waybar.nix
      ./wlogout.nix
      ./xdg.nix
    ]
    ++ lib.optionals isLaptop ./niri.nix;

  home = {
    username = "onat";
    homeDirectory = "/home/onat";
    stateVersion = "24.11";

    sessionVariables = {
      EDITOR = "hx";
      VISUAL = "hx";
    };
  };
}
