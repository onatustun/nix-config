{
  lib,
  import-tree,
  username,
  ...
}: let
  inherit (builtins) baseNameOf;
  inherit (lib) adminUserKeys;
in {
  imports = [
    (import-tree.filterNot (path:
      baseNameOf path == "default.nix")
    ./.)
  ];

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
