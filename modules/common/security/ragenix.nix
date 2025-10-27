{
  inputs',
  pkgs,
  ...
}: {
  age.identityPaths = ["/etc/ssh/ssh_host_ed25519_key"];

  environment.systemPackages = [
    inputs'.ragenix.packages.default
    pkgs.age
    pkgs.ssh-to-age
  ];
}
