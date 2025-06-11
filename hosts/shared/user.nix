{
  pkgs,
  hostName,
  ...
}: {
  networking = {
    networkmanager.enable = true;
    hostName = "hostName";
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
        "networkmanager"
        "wheel"
      ];
    };
  };
}
