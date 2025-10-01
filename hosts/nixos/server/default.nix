lib: inputs:
lib.nixosSystem' {
  hostName = "server";
  system = "x86_64-linux";
  username = "onat";
  stateVer = "24.11";
  homeVer = "24.11";

  overlays = [
    inputs.nix-index-database.overlays.nix-index
    inputs.nuenv.overlays.default
  ];

  inputModules = [
    inputs.determinate.nixosModules.default
    inputs.disko.nixosModules.default
    inputs.home-manager.nixosModules.default
    inputs.nix-index-database.nixosModules.nix-index
    inputs.stylix.nixosModules.stylix
  ];

  modules = [
    "common"
    "nixos/security"
    "nixos/system"
    "nixos/ui"
  ];

  ignore = [
    "apps"
    "toolchains"
  ];

  module = {
    lib,
    username,
    pkgs,
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
          "input"
          "libvirt"
          "networkmanager"
          "power"
          "storage"
          "wheel"
        ];
      };
    };

    environment.systemPackages = with pkgs; [
      caddy
      jellyfin
      jellyfin-ffmpeg
      jellyfin-web
    ];

    services = {
      jellyfin = {
        enable = true;
        user = "onat";
      };

      caddy = {
        enable = true;

        virtualHosts."https://jellyfin.ust.sh".extraConfig = ''
          reverse_proxy 127.0.0.1:8096
        '';
      };
    };
  };
}
