{
  lib,
  inputs,
  ...
}: let
  inherit (inputs) self nixpkgs home-manager nur;
  inherit (lib.filesystem) listFilesRecursive;
  inherit (lib) filter hasSuffix;
  mkNixos = hostName: system: username:
    nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {inherit inputs hostName username;};

      modules =
        [
          home-manager.nixosModules.home-manager
          nur.modules.nixos.default

          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              backupFileExtension = "backup";
              users.${username}.imports = listFilesRecursive (self + /modules/home) |> filter (hasSuffix ".nix");
              extraSpecialArgs = {inherit inputs system username;};
            };
          }
        ]
        ++ (listFilesRecursive (self + /modules/nixos) |> filter (hasSuffix ".nix"))
        ++ (listFilesRecursive (self + /hosts/${hostName}) |> filter (hasSuffix ".nix"));
    };
in {
  _module.args.mkNixos = mkNixos;
}
