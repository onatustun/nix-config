{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    openvpn
    protonvpn-cli
    protonvpn-gui
    wireguard-tools
  ];
}
