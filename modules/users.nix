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
        users.users.${username} = {
          home = homeDir;
          isNormalUser = mkDefault true;
        };
      };
  };
}
