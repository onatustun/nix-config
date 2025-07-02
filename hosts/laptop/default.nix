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

  home-manager = {
    users.${username}.home.stateVersion = "24.11";

    sharedModules = [
      {
        wayland.windowManager.hyprland.settings.monitor = [
          "eDP-1, 2256x1504@60, 0x0, 1.5667"
          "DP-3, 3840x2400, auto-down, 2.4"
        ];
      }
    ];
  };

  environment.systemPackages = [pkgs.framework-tool];
  hardware.framework.enableKmod = true;
  services.fwupd.enable = true;
  system.stateVersion = "24.11";
}
