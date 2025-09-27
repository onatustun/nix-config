{
  inputs,
  pkgs,
  ...
}: {
  home-manager.sharedModules = [
    {
      programs.wlogout = {
        enable = true;
        package = inputs.nixpkgs-wayland.packages.${pkgs.stdenv.hostPlatform.system}.wlogout;

        layout = [
          {
            label = "lock";
            action = "swaylock -DefF";
            text = "Lock";
          }
          {
            label = "logout";
            action = "loginctl terminate-user $USER";
            text = "Logout";
          }
          {
            label = "shutdown";
            action = "systemctl poweroff";
            text = "Shutdown";
          }
          {
            label = "reboot";
            action = "systemctl reboot";
            text = "Reboot";
          }
        ];
      };
    }
  ];
}
