{
  flake.nixosModules = {
    core = {username, ...}: {
      _module.args.homeDir = "/home/${username}";
    };

    system = {
      lib,
      self,
      ...
    }: {
      imports = lib.lists.singleton self.nixosModules.users;
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
}
