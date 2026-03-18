{
  flake.modules.homeManager = {
    gui = {
      lib,
      self,
      ...
    }: {
      imports = lib.lists.singleton self.modules.homeManager.proton;
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
