{
  isDarwin,
  inputs,
  pkgs,
  ...
}: {
  imports =
    if isDarwin
    then [inputs.agenix.darwinModules.default]
    else [inputs.agenix.nixosModules.default];

  age.identityPaths = ["/etc/ssh/ssh_host_ed25519_key"];

  environment.systemPackages =
    [inputs.agenix.packages.${pkgs.stdenv.hostPlatform.system}.default]
    ++ (with pkgs; [
      age
      ssh-to-age
    ]);
}
