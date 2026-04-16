{
  flake.modules.homeManager.proton =
    { pkgs, ... }:
    {
      home.packages = [
        pkgs.openvpn
        pkgs.proton-vpn
        pkgs.wireguard-tools
      ];
    };
}
