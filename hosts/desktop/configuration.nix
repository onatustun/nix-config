{
  config,
  self,
  ...
}: {
  flake = config.mk-os "nixos" "desktop" {
    system = "x86_64-linux";
    username = "onat";
    stateVersion = "24.11";
    homeVersion = "24.11";

    modules = [
      self.modules.nixos.desktop
      self.modules.nixos.hardware-desktop
      self.modules.nixos.hyprland
      self.modules.nixos.system
      self.modules.nixos.terminal
      self.modules.nixos.ui
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
