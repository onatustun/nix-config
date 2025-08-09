{
  username,
  homeDir,
  ...
}: {
  users.users.${username}.home = homeDir;
  system.stateVersion = 6;
}
