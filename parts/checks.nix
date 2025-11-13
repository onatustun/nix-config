{
  inputs,
  self,
  ...
}: {
  perSystem = {system, ...}: {
    checks =
      inputs.deploy-rs.lib.${system}.deployChecks
      self.deploy;
  };
}
