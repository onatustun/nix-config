{
  lib,
  username,
  ...
}: let
  inherit (lib) adminUserKeys;
in {
  users.users = {
    root.openssh.authorizedKeys.keys = adminUserKeys;
    ${username}.openssh.authorizedKeys.keys = adminUserKeys;
  };
}
