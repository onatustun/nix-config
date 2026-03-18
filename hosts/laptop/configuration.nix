{
  lib,
  config,
  self,
  ...
}: {
  flake = let
    type = "nixos";
  in
    lib.attrsets.recursiveUpdate {
      modules.${type}.core = {hostName, ...}: {
        _module.args.isLaptop = hostName == "laptop";
      };
    }
    (config.mk-os type {
      system = "x86_64-linux";
      hostName = "laptop";
      username = "onat";
      stateVersion = "26.05";
      homeVersion = "26.05";

      modules =
        (lib.lists.map (module: self.modules.${type}.${module}) [
          "desktop"
          "hardware-laptop"
          "niri"
          "system"
          "terminal"
          "ui"
        ])
        ++ lib.lists.singleton ({
          keys,
          username,
          ...
        }: {
          users.users = {
            root.openssh.authorizedKeys.keys = keys.adminUserKeys;

            ${username} = {
              openssh.authorizedKeys.keys = keys.adminUserKeys;

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
        });

      hmModules = lib.lists.map (module: self.modules.homeManager.${module}) [
        "noctalia"
        "wayvnc"
        "zmkbatx"
      ];
    });
}
