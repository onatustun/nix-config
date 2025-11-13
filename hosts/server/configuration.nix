{
  config,
  inputs,
  self,
  ...
}: {
  flake = config.mk-os "nixos" "server" {
    system = "x86_64-linux";
    username = "onat";
    stateVersion = "24.11";
    homeVersion = "24.11";

    overlays = [
      inputs.deploy-rs.overlays.default
      inputs.nix-index-database.overlays.nix-index
      inputs.nur.overlays.default
      inputs.ragenix.overlays.default
    ];

    modules = [
      self.modules.nixos.boot
      self.modules.nixos.cli
      self.modules.nixos.disko
      self.modules.nixos.hardware-server
      self.modules.nixos.kernel
      self.modules.nixos.locale
      self.modules.nixos.network
      self.modules.nixos.nix
      self.modules.nixos.security
      self.modules.nixos.shells
      self.modules.nixos.ui
      self.modules.nixos.users
    ];

    hmModules = [
      self.modules.homeManager.tui
      self.modules.homeManager.xdg
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
            "input"
            "libvirt"
            "networkmanager"
            "power"
            "storage"
            "wheel"
          ];
        };
      };

      services = {
        jellyfin = {
          enable = true;
          user = username;
        };

        caddy = {
          enable = true;

          virtualHosts."https://jellyfin.ust.sh".extraConfig = ''
            reverse_proxy 127.0.0.1:8096
          '';
        };
      };
    };
  };
}
