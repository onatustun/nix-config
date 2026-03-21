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
            openssh.authorizedKeys.keys = keys.userKeys;
          };

          ${username} = {
            hashedPasswordFile = config.age.secrets.password.path;
            home = homeDir;
            isNormalUser = true;
            openssh.authorizedKeys.keys = keys.userKeys;

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
      };
    };

    homeModules.laptop-hm.home.stateVersion = "26.05";
  };
}
