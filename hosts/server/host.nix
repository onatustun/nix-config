{
  flake = {
    nixosModules = {
      core = {hostName, ...}: {
        _module.args.isServer = hostName == "server";
      };

      server-host = {
        keys,
        username,
        lib,
        self,
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

        nixpkgs.hostPlatform.system = "x86_64-linux";
        system.stateVersion = "26.05";

        home-manager.sharedModules = lib.attrsets.attrValues (lib.attrsets.getAttrs [
            "server-hm"
            "xdg"
          ]
          self.homeModules);
      };
    };

    homeModules.server-hm.home.stateVersion = "26.05";
  };
}
