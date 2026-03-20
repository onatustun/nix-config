{
  flake.homeModules = {
    gui = {
      lib,
      inputs,
      ...
    }: {
      imports = lib.lists.singleton inputs.self.homeModules.proton;
    };

    proton = {pkgs, ...}: {
      home.packages = [
        pkgs.openvpn
        pkgs.protonvpn-gui
        pkgs.wireguard-tools
      ];
    };
  };
}
