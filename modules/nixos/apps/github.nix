{
  lib,
  pkgs,
  inputs,
  ...
}: let
  inherit (lib) concatLists;
in {
  environment.systemPackages = concatLists [
    (with pkgs; [
      gh
      github-desktop
    ])

    [inputs.lazygit.packages.${pkgs.stdenv.hostPlatform.system}.default]
  ];

  home-manager.sharedModules = [
    {
      programs.gh = {
        enable = true;
        settings.git_protocol = "ssh";
      };
    }
  ];
}
