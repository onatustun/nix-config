{pkgs, ...}: {
  programs.fish.enable = true;

  users = {
    defaultUserShell = pkgs.fish;
    users.onat = {
      shell = pkgs.fish;
      useDefaultShell = true;
      isNormalUser = true;

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
