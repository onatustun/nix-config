{ moduleWithSystem, ... }:
{
  flake.homeModules.helium = moduleWithSystem (
    { inputs', ... }:
    { lib, ... }:
    let
      inherit (lib.meta) getExe;
      package = inputs'.helium.packages.default;
    in
    {
      home = {
        sessionVariables."BROWSER" = getExe package;
        packages = [ package ];
      };
    }
  );
}
