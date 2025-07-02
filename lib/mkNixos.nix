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
  }: let
    homeDir = "/home/${username}";
    moduleFiles = lib.flatten (map (moduleDir: filter (hasSuffix ".nix") (listFilesRecursive (self + /modules/${moduleDir}))) modules);
  in
    nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {inherit inputs hostName username homeDir;};

      modules =
        [
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useUserPackages = true;
              backupFileExtension = "backup";
              extraSpecialArgs = {inherit inputs system username homeDir;};
            };
          }
        ]
        ++ filter (hasSuffix ".nix") (listFilesRecursive (self + /hosts/${hostName}))
        ++ moduleFiles;
    };
in {
  _module.args.mkNixos = mkNixos;
}
