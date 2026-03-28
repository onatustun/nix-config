{
  flake.nixosModules = {
    core = {username, ...}: {
      _module.args.homeDir = "/home/${username}";
    };

    users = {
      username,
      homeDir,
      lib,
      ...
    }: {
      users = {
        users.${username} = {
          home = homeDir;
          isNormalUser = lib.modules.mkDefault true;
        };

        mutableUsers = false;
      };
    };
  };
}
