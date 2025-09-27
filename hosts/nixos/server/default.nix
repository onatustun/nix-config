{
  lib,
  username,
  pkgs,
  ...
}: let
  inherit (lib) filesystem filter hasSuffix remove adminUserKeys;
  inherit (filesystem) listFilesRecursive;
in {
  imports =
    listFilesRecursive ./.
    |> filter (hasSuffix ".nix")
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
}
