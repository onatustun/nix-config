{
  lib,
  inputs,
  ...
}: let
  inherit (inputs) self nixpkgs home-manager;
  inherit (lib.filesystem) listFilesRecursive;
  inherit (lib) filter hasSuffix;

  mkNixos = {
    hostName,
    system,
    username,
    modules,
    extraModules ? [],
    overlays ? [],
    packages ? [],
    extraInputs ? {},
  }: let
    homeDir = "/home/${username}";
    moduleFiles = lib.flatten (map (moduleDir: filter (hasSuffix ".nix") (listFilesRecursive (self + /modules/${moduleDir}))) modules);
    packageOverlay = final: prev: lib.genAttrs packages (name: final.callPackage (self + /pkgs/${name}.nix) {});
  in
    nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {inherit inputs hostName username homeDir;} // extraInputs;

      modules =
        [
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useUserPackages = true;
              backupFileExtension = "backup";
              extraSpecialArgs = {inherit inputs system username homeDir;} // extraInputs;
            };
          }

          {
            nixpkgs.overlays = overlays ++ lib.optional (packages != []) packageOverlay;
          }
        ]
        ++ filter (hasSuffix ".nix") (listFilesRecursive (self + /hosts/${hostName}))
        ++ moduleFiles
        ++ extraModules;
    };
in {
  _module.args.mkNixos = mkNixos;
}
