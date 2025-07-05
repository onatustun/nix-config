{
  pkgs,
  username,
  ...
}: {
  users.users.${username} = {
    shell = pkgs.fish;
    useDefaultShell = true;
    isNormalUser = true;
  };
}
