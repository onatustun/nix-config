{
  pkgs,
  lib,
  ...
}: {
  services = {
    gnome.gnome-keyring.enable = true;
    dbus.packages = [pkgs.gnome-keyring];
  };

  home-manager.sharedModules = [
    {
      programs.git = let
        inherit (lib) enabled;
      in
        enabled {
          lfs.enable = true;
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
