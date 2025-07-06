{
  username,
  inputs,
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
  };

  system.stateVersion = "24.11";
}
