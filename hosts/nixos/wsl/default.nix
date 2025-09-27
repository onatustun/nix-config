{
  inputs,
  username,
  pkgs,
  ...
}: {
  imports = [inputs.nixos-wsl.nixosModules.default];

  users.users.${username}.extraGroups = [
    "input"
    "libvirt"
    "storage"
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

  environment.systemPackages = with pkgs; [
    curl
    procps
    wget
    wsl-open
    wslu
    wsl-vpnkit
  ];
}
