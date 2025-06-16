{
  hostName,
  pkgs,
  shell,
  wm,
  lib,
  ...
}: {
  networking = {
    networkmanager.enable = true;
    hostName = hostName;
  };

  programs =
    {
      ${shell}.enable = true;
    }
    // lib.optionalAttrs (wm == "hyprland") {
      hyprland.enable = true;
    };

  users = {
    defaultUserShell = pkgs.${shell};

    users.onat = {
      isNormalUser = true;
      useDefaultShell = true;
      shell = pkgs.${shell};

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
