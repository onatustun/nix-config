{
  lib,
  username,
  ...
}: let
  inherit (lib) filesystem filter hasSuffix remove adminUserKeys;
  inherit (filesystem) listFilesRecursive;
in {
  imports =
    listFilesRecursive ./.
    |> filter (hasSuffix ".nix")
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
