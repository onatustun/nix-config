{
  lib,
  username,
  keys,
  ...
}: let
  inherit (lib) collectNix remove;
in {
  imports =
    collectNix ./.
    |> remove ./default.nix;

  users.users.${username}.extraGroups = [
    "audio"
    "input"
    "libvirt"
    "networkmanager"
    "power"
    "storage"
    "video"
    "wheel"
  ];

  users.users.root.openssh.authorizedKeys.keys = keys.all;
}
