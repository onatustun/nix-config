{
  hostName,
  pkgs,
  ...
}: {
  networking = {
    networkmanager.enable = true;
    hostName = hostName;
  };

  programs = {
    fish.enable = true;
    hyprland.enable = true;
  };

  users = {
    defaultUserShell = pkgs.fish;

    users.onat = {
      isNormalUser = true;
      useDefaultShell = true;
      shell = pkgs.fish;

      extraGroups = [
        "audo"
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
