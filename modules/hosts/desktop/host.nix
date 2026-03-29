{
  flake = {
    nixosModules = {
      core =
        { hostName, ... }:
        {
          _module.args.isDesktop = hostName == "desktop";
        };

      desktop-host =
        {
          config,
          keys,
          username,
          ...
        }:
        {
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
              openssh.authorizedKeys.keys = keys.userKeys;

              extraGroups = [
                "networkmanager"
                "storage"
                "wheel"
              ];
            };
          };

          nixpkgs.hostPlatform.system = "x86_64-linux";
          system.stateVersion = "26.05";
        };
    };

    homeModules.desktop-hm.home.stateVersion = "26.05";
  };
}
