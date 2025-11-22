{
  flake.modules.homeManager.proton = {pkgs, ...}: {
    home.packages = [
      pkgs.openvpn
      pkgs.protonvpn-gui
      pkgs.wireguard-tools
    ];
  };
}
