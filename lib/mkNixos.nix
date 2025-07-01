{
  lib,
  inputs,
  ...
}: let
  inherit (inputs) self nixpkgs home-manager;
  inherit (lib.filesystem) listFilesRecursive;
  inherit (lib) filter hasSuffix;
  mkNixos = hostName: system:
    nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {inherit inputs hostName;};

      modules =
        [
          home-manager.nixosModules.home-manager

          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              backupFileExtension = "backup";
              users.onat.imports = listFilesRecursive (self + /modules/home) |> filter (hasSuffix ".nix");
              extraSpecialArgs = {inherit inputs system;};
            };
          }
        ]
        ++ (listFilesRecursive (self + /modules/nixos) |> filter (hasSuffix ".nix"))
        ++ (listFilesRecursive (self + /hosts/${hostName}) |> filter (hasSuffix ".nix"));
    };
in {
  _module.args.mkNixos = mkNixos;
}
