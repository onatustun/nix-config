{
  lib,
  inputs,
  ...
}: let
  inherit (inputs) self nixpkgs home-manager;
  inherit (lib.filesystem) listFilesRecursive;
  inherit (lib) filter hasSuffix;
  mkNixos = hostName: system: username: let
    homeDir = "/home/${username}";
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
              users.${username}.imports = listFilesRecursive (self + /modules/home) |> filter (hasSuffix ".nix");
              extraSpecialArgs = {inherit inputs system username homeDir;};
            };
          }
        ]
        ++ (listFilesRecursive (self + /modules/nixos) |> filter (hasSuffix ".nix"))
        ++ (listFilesRecursive (self + /hosts/${hostName}) |> filter (hasSuffix ".nix"));
    };
in {
  _module.args.mkNixos = mkNixos;
}
