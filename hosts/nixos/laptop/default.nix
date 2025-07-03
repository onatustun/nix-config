{
  inputs,
  pkgs,
  username,
  ...
}: {
  imports = [inputs.hardware.nixosModules.framework-13-7040-amd];

  users.users.${username} = {
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

  environment.systemPackages = [pkgs.framework-tool];
  hardware.framework.enableKmod = true;
  services.fwupd.enable = true;
  home-manager.users.${username}.home.stateVersion = "24.11";
  system.stateVersion = "24.11";
}
