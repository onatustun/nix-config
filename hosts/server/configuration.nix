{
  lib,
  config,
  self,
  ...
}: {
  flake = let
    type = "nixos";
  in
    lib.attrsets.recursiveUpdate {
      modules.${type}.core = {hostName, ...}: {
        _module.args.isServer = hostName == "server";
      };
    }
    (config.mk-os type {
      system = "x86_64-linux";
      hostName = "server";
      username = "onat";
      stateVersion = "26.05";
      homeVersion = "26.05";

      modules =
        (lib.lists.map (module: self.modules.${type}.${module}) [
          "cli"
          "disko"
          "hardware-server"
          "kernel"
          "loader"
          "locale"
          "network"
          "nix"
          "scx"
          "security"
          "shells"
          "tui"
          "ui"
          "users"
        ])
        ++ lib.lists.singleton ({
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
        });

      hmModules = lib.lists.singleton self.modules.homeManager.xdg;
    });
}
