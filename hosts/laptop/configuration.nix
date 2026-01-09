{
  config,
  self,
  ...
}: {
  flake = config.mk-os "nixos" "laptop" {
    system = "x86_64-linux";
    username = "onat";
    stateVersion = "26.05";
    homeVersion = "26.05";

    modules = [
      self.modules.nixos.compositors
      self.modules.nixos.desktop
      self.modules.nixos.hardware-laptop
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
