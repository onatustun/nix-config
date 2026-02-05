{
  config,
  self,
  ...
}: {
  flake = config.mk-os "nixos" "desktop" {
    system = "x86_64-linux";
    username = "onat";
    stateVersion = "26.05";
    homeVersion = "26.05";

    modules = [
      self.modules.nixos.desktop
      self.modules.nixos.hardware-desktop
      self.modules.nixos.niri
      self.modules.nixos.system
      self.modules.nixos.terminal
      self.modules.nixos.ui
    ];

    hmModules = [
      self.modules.homeManager.noctalia
      self.modules.homeManager.wayvnc
    ];

    module = {
      keys,
      username,
      ...
    }: {
      users.users = {
        root.openssh.authorizedKeys.keys = keys.adminUserKeys;

        ${username} = {
          openssh.authorizedKeys.keys = keys.adminUserKeys;

          extraGroups = [
            "audio"
            "input"
            "libvirt"
            "networkmanager"
            "power"
            "storage"
            "video"
            "wheel"
          ];
        };
      };
    };
  };
}
