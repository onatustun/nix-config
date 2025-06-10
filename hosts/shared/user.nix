{
  pkgs,
  ...
}: {
  networking.networkmanager.enable = true;

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
