{
  flake.nixosModules = {
    core = {username, ...}: {
      _module.args.homeDir = "/home/${username}";
    };

    users.users.mutableUsers = false;
  };
}
