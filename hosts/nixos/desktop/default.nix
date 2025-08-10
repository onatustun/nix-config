{
  lib,
  username,
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
}
