{
  lib,
  inputs,
  pkgs,
  ...
}: let
  inherit (lib) concatLists;
in {
  age.identityPaths = ["/etc/ssh/ssh_host_ed25519_key"];

  environment.systemPackages = concatLists [
    [inputs.ragenix.packages.${pkgs.stdenv.hostPlatform.system}.default]

    (with pkgs; [
      age
      ssh-to-age
    ])
  ];
}
