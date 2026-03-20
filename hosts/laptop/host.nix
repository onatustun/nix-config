{
  flake = {
    nixosModules = {
      core = {hostName, ...}: {
        _module.args.isLaptop = hostName == "laptop";
      };

      laptop-host = {
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
            "laptop-hm"
            "noctalia"
            "wayvnc"
            "zmkbatx"
          ]
          inputs.self.homeModules);
      };
    };

    homeModules.laptop-hm.home.stateVersion = "26.05";
  };
}
