{
  inputs,
  pkgs,
  ...
}: {
  environment.systemPackages =
    [inputs.agenix.packages.${pkgs.stdenv.hostPlatform.system}.default]
    ++ (with pkgs; [
      age
      ssh-to-age
    ]);
}
