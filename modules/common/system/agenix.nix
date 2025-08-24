{
  inputs,
  pkgs,
  ...
}: {
  environment.systemPackages = [
    inputs.agenix.packages.${pkgs.stdenv.hostPlatform.system}.default
    pkgs.age
    pkgs.ssh-to-age
  ];
}
