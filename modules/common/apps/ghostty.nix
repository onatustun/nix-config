{
  lib,
  username,
  homeDir,
  pkgs,
  isDarwin,
  inputs,
  ...
}: let
  inherit (lib) concatStringsSep getExe enabled;

  guiPath = concatStringsSep ":" [
    "/nix/var/nix/profiles/default/bin"
    "/etc/profiles/per-user/${username}/bin"
    "${homeDir}/.nix-profile/bin"
    "/usr/local/bin"
    "/usr/bin"
    "/bin"
    "/usr/sbin"
    "/sbin"
  ];

  nuExe = getExe pkgs.nushell;
in {
  home-manager.sharedModules = [
    {
      programs.ghostty = enabled {
        package =
          if isDarwin
          then null
          else inputs.ghostty.packages.${pkgs.stdenv.hostPlatform.system}.default;

        installBatSyntax = !isDarwin;
        installVimSyntax = !isDarwin;

        settings = {
          command =
            if isDarwin
            then "/usr/bin/env PATH=${guiPath} ${nuExe} --login"
            else "${nuExe} --login";

          bold-is-bright = true;
          confirm-close-surface = false;
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
