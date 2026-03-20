{
  flake = {
    nixosModules = {
      core = {hostName, ...}: {
        _module.args.isServer = hostName == "server";
      };

      server-host = {
        config,
        keys,
        username,
        homeDir,
        lib,
        inputs,
        ...
      }: {
        age.secrets.password = {
          file = ./password.age;
          owner = "root";
          group = "root";
          mode = "0400";
        };

        users.users = {
          root = {
            hashedPasswordFile = config.age.secrets.password.path;
            openssh.authorizedKeys.keys = keys.adminUserKeys;
          };

          ${username} = {
            hashedPasswordFile = config.age.secrets.password.path;
            home = homeDir;
            isNormalUser = true;
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
          inputs.self.homeModules);
      };
    };

    homeModules.server-hm.home.stateVersion = "26.05";
  };
}
