{
  flake.homeModules.proton =
    { lib, pkgs, ... }:
    let
      inherit (lib.attrsets) attrValues;
    in
    {
      home.packages = attrValues {
        inherit (pkgs)
          openvpn
          proton-vpn
          wireguard-tools
          ;
      };
    };
}
