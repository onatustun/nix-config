{
  flake.modules = {
    nixos = {
      core = {username, ...}: {
        _module.args.homeDir = "/home/${username}";
      };

      system = {
        lib,
        self,
        type,
        ...
      }: {
        imports = lib.lists.singleton self.modules.${type}.users;
      };

      users = {
        self,
        hostName,
        config,
        username,
        homeDir,
        ...
      }: {
        age.secrets.password = {
          file = "${self}/secrets/nixos/${hostName}/password.age";
          owner = "root";
          group = "root";
          mode = "0400";
        };

        users = {
          mutableUsers = false;

          users = {
            root.hashedPasswordFile = config.age.secrets.password.path;

            ${username} = {
              hashedPasswordFile = config.age.secrets.password.path;
              home = homeDir;
              isNormalUser = true;
            };
          };
        };
      };
    };

    darwin.core = {username, ...}: {
      _module.args.homeDir = "/Users/${username}";
    };
  };
}
