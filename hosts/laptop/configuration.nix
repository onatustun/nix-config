{
  config,
  inputs,
  self,
  ...
}: {
  flake = config.mk-os "nixos" "laptop" {
    system = "x86_64-linux";
    username = "onat";
    stateVersion = "24.11";
    homeVersion = "24.11";

    packages = ["bibata-hyprcursor"];

    overlays = [
      inputs.deploy-rs.overlays.default
      inputs.niri.overlays.niri
      inputs.nix-index-database.overlays.nix-index
      inputs.nur.overlays.default
      inputs.ragenix.overlays.default
    ];

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
