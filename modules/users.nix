{
  flake.nixosModules = {
    core =
      { username, ... }:
      {
        _module.args.homeDir = "/home/${username}";
      };

    users =
      {
        lib,
        username,
        homeDir,
        ...
      }:
      let
        inherit (lib.modules) mkDefault;
      in
      {
        users = {
          mutableUsers = false;

          users.${username} = {
            home = homeDir;
            isNormalUser = mkDefault true;
          };
        };
      };
  };
}
