{
  lib,
  username,
  ...
}: let
  inherit (lib) collectNix remove adminUserKeys;
in {
  imports =
    collectNix ./.
    |> remove ./default.nix;

  users.users = {
    root.openssh.authorizedKeys.keys = adminUserKeys;

    ${username} = {
      openssh.authorizedKeys.keys = adminUserKeys;

      extraGroups = [
        "audio"
        "input"
        "libvirt"
        "networkmanager"
        "power"
        "storage"
        "video"
        "wheel"
      ];
    };
  };
}
