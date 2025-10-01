inputs: {
  system = "x86_64-linux";
  username = "onat";
  stateVer = "24.11";
  homeVer = "24.11";
  packages = ["bibata-hyprcursor"];

  overlays = [
    inputs.niri.overlays.niri
    inputs.nix-index-database.overlays.nix-index
  ];

  inputModules = [
    inputs.nix-index-database.nixosModules.nix-index
    inputs.stylix.nixosModules.stylix
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
