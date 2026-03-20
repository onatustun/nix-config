{
  flake.homeModules = {
    gui = {
      lib,
      self,
      ...
    }: {
      imports = lib.lists.singleton self.homeModules.proton;
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
