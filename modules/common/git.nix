{
  lib,
  # pkgs,
  ...
}: let
  inherit (lib) enabled;
in {
  # services = {
  #   gnome.gnome-keyring = enabled;
  #   dbus.packages = [pkgs.gnome-keyring];
  # };

  home-manager.sharedModules = [
    {
      programs.git = enabled {
        lfs = enabled;
        userName = "onatustun";
        userEmail = "o@ust.sh";

        ignores = [
          ".direnv"
          ".envrc"
        ];

        extraConfig = {
          init.defaultBranch = "main";
          safe.directory = "~/nix";
        };
      };
    }
  ];
}
