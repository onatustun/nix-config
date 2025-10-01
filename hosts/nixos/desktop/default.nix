lib: inputs:
lib.nixosSystem' {
  hostName = "desktop";
  system = "x86_64-linux";
  username = "onat";
  stateVer = "24.11";
  homeVer = "24.11";
  packages = ["bibata-hyprcursor"];

  overlays = [
    inputs.nix-index-database.overlays.nix-index
    inputs.nuenv.overlays.default
    inputs.nur.overlays.default
  ];

  inputModules = [
    inputs.determinate.nixosModules.default
    inputs.home-manager.nixosModules.default
    inputs.nix-index-database.nixosModules.nix-index
    inputs.stylix.nixosModules.stylix
  ];

  modules = [
    "nixos"
    "common"
  ];

  ignore = [
    "niri.nix"
    "swayidle.nix"
    "xwayland.nix"
  ];

  module = {
    lib,
    username,
    ...
  }: let
    inherit (lib) collectNix remove adminUserKeys;
  in {
    imports =
      collectNix ./.
      |> remove ./default.nix;

    users.users = {
      root.openssh.authorizedKeys.keys = adminUserKeys;

      ${username} = {
        openssh.authorizedKeys.keys = adminUserKeys;

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
  };
}
