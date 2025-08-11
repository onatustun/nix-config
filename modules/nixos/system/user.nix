{username, ...}: {
  users.users.${username} = {
    isNormalUser = true;
    initialPassword = "Password123";
  };
}
