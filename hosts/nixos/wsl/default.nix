inputs: {
  system = "x86_64-linux";
  username = "onat";
  stateVer = "24.11";
  homeVer = "24.11";
  overlays = [inputs.nix-index-database.overlays.nix-index];

  inputModules = [
    inputs.nix-index-database.nixosModules.nix-index
    inputs.stylix.nixosModules.stylix
  ];

  # modules = [
  #   "common"
  #   "nixos/cli/clipboard.nix"
  #   "nixos/security"
  #   "nixos/system"
  #   "nixos/ui"
  # ];

  # ignore = [
  #   "apps"
  #   "boot.nix"
  #   "kernel.nix"
  #   "tmp.nix"
  # ];

  module = {
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
  };
}
