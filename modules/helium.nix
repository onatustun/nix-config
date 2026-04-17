{ moduleWithSystem, ... }:
{
  flake.modules.homeManager.helium = moduleWithSystem (
    { inputs', ... }:
    { lib, ... }:
    let
      inherit (lib.meta) getExe;
    in
    {
      home = {
        sessionVariables.BROWSER = getExe inputs'.helium.packages.default;
        packages = [ inputs'.helium.packages.default ];
      };
    }
  );
}
