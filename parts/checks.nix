{
  inputs,
  self,
  ...
}: {
  perSystem = {pkgs, ...}: {
    checks =
      inputs.deploy-rs.lib.${pkgs.stdenv.hostPlatform.system}.deployChecks
      self.deploy;
  };
}
