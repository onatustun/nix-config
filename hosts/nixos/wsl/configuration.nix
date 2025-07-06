{
  username,
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.nixos-wsl.nixosModules.default];

  users.users.${username}.extraGroups = [
    "audio"
    "input"
    "libvirt"
    "networkmanager"
    "power"
    "storage"
    "video"
    "wheel"
  ];

  wsl = {
    enable = true;
    defaultUser = username;
    startMenuLaunchers = true;

    wslConf = {
      automount.root = "/mnt";
      interop.appendWindowsPath = false;
      network.generateHosts = false;
    };
  };

  environment.etc."clipboard-init.sh" = {
    text = ''
      #!${pkgs.bash}/bin/bash

      ${pkgs.procps}/bin/pkill -f "wl-paste.*cliphist" || true
      ${pkgs.procps}/bin/pkill -f "wl-clip-persist" || true

      ${pkgs.wl-clipboard}/bin/wl-paste --type image --watch ${pkgs.cliphist}/bin/cliphist store &
      ${pkgs.wl-clipboard}/bin/wl-paste --type text --watch ${pkgs.cliphist}/bin/cliphist store &
      ${pkgs.wl-clip-persist}/bin/wl-clip-persist --clipboard both &
    '';

    mode = "0755";
  };

  environment.systemPackages = with pkgs; [
    cliphist
    curl
    procps
    wget
    wl-clipboard
    wl-clip-persist
  ];

  system.stateVersion = "24.11";
}
