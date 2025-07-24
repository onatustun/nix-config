{
  lib,
  inputs,
  ...
}:
lib.mkNixos {
  hostName = "desktop";
  system = "x86_64-linux";
  username = "onat";
  homeVer = "24.11";
  packages = ["bibata-hyprcursor"];

  inputModules = [
    inputs.determinate.nixosModules.default
    inputs.home-manager.nixosModules.home-manager
    inputs.nix-index-database.nixosModules.nix-index
    inputs.stylix.nixosModules.stylix
  ];

  overlays = [inputs.nur.overlays.default];

  modules = [
    "nixos"
    "common"
  ];

  ignore = [
    "niri"
    "swayidle"
    "xwayland"
  ];
} ({
  lib,
  config,
  username,
  ...
}: let
  inherit (lib) collectNix remove;
in {
  imports = collectNix ./. |> remove ./default.nix;
  services.xserver.videoDrivers = ["nvidia"];
  system.stateVersion = "24.11";

  hardware.nvidia = {
    modesetting.enable = true;
    open = false;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

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
})
