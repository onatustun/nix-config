{
  flake.modules.nixos.users = {
    config,
    username,
    homeDir,
    secretsDir,
    hostName,
    ...
  }: {
    age.secrets.password = {
      file = "${secretsDir}/nixos/${hostName}/password.age";
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
}
