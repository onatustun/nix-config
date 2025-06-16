{
  hostName,
  pkgs,
  shell,
  wm,
  ...
}: {
  networking = {
    networkmanager.enable = true;
    hostName = hostName;
  };

  programs = {
    ${shell}.enable = true;
    ${wm}.enable = true;
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
