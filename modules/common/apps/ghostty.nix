{
  lib,
  username,
  homeDir,
  pkgs,
  isDarwin,
  inputs',
  ...
}: let
  inherit (lib) concatStringsSep getExe;

  guiPathDirs = [
    "/nix/var/nix/profiles/default/bin"
    "/etc/profiles/per-user/${username}/bin"
    "${homeDir}/.nix-profile/bin"
    "/usr/local/bin"
    "/usr/bin"
    "/bin"
    "/usr/sbin"
    "/sbin"
  ];

  guiPath =
    guiPathDirs
    |> concatStringsSep ":";

  nuExe = getExe pkgs.nushell;
in {
  home-manager.sharedModules = [
    {
      programs.ghostty = {
        enable = true;

        package =
          if isDarwin
          then null
          else inputs'.ghostty.packages.default;

        installBatSyntax = !isDarwin;
        installVimSyntax = !isDarwin;

        settings = {
          command =
            if isDarwin
            then "/usr/bin/env PATH=${guiPath} ${nuExe} --login"
            else "${nuExe} --login";

          bold-is-bright = true;
          confirm-close-surface = false;
          font-size = 14;
          gtk-titlebar = false;
          mouse-hide-while-typing = true;
          shell-integration-features = "no-cursor";
          window-decoration = "auto";

          font-feature = [
            "-calt"
            "-liga"
            "-dlig"
          ];
        };
      };
    }
  ];
}
