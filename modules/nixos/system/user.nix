{
  secretsDir,
  hostName,
  config,
  username,
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
        isNormalUser = true;
        hashedPasswordFile = config.age.secrets.password.path;
      };
    };
  };
}
