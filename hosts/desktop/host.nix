{
  flake = {
    nixosModules = {
      core = {hostName, ...}: {
        _module.args.isDesktop = hostName == "desktop";
      };

      desktop-host = {
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

        nixpkgs.hostPlatform.system = "x86_64-linux";
        system.stateVersion = "26.05";

        home-manager.sharedModules = lib.attrsets.attrValues (lib.attrsets.getAttrs [
            "desktop-hm"
            "noctalia"
            "wayvnc"
          ]
          self.homeModules);
      };
    };

    homeModules.desktop-hm.home.stateVersion = "26.05";
  };
}
