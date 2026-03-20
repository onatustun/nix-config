{
  flake.nixosModules = {
    core = {username, ...}: {
      _module.args.homeDir = "/home/${username}";
    };

    system = {
      lib,
      inputs,
      ...
    }: {
      imports = lib.lists.singleton inputs.self.nixosModules.users;
    };

    users.users.mutableUsers = false;
  };
}
