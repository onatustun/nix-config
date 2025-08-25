{
  lib,
  pkgs,
  ...
}: let
  inherit (lib) enabled;
in {
  environment.systemPackages = with pkgs; [
    openvpn
    protonvpn-cli
    protonvpn-gui
    wireguard-tools
  ];

  security.polkit = enabled;
}
