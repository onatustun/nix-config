{
  lib,
  username,
  pkgs,
  ...
}: let
  inherit (lib) collectNix remove adminUserKeys enabled;
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
    jellyfin = enabled {user = "onat";};

    caddy = enabled {
      virtualHosts."https://jellyfin.ust.sh".extraConfig = ''
        reverse_proxy 127.0.0.1:8096
      '';
    };
  };
}
