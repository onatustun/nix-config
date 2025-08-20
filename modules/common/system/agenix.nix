{
  inputs,
  pkgs,
  ...
}: {
  environment.systemPackages = [inputs.agenix.packages.${pkgs.stdenv.hostPlatform.system}.default];
  age.identityPaths = ["~/.ssh/id_ed25519"];
}
