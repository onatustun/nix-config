{
  lib,
  inputs,
  ...
}: let
  inherit (inputs) self nixpkgs home-manager;
  inherit (lib) genAttrs optional filter hasSuffix flatten;
  inherit (lib.filesystem) listFilesRecursive;

  mkNixos = {
    hostName,
    system,
    username,
    modules,
    overlays ? [],
    packages ? [],
  }: let
    homeDir = "/home/${username}";
    packageOverlay = final: prev: genAttrs packages (name: final.callPackage (self + /pkgs/${name}.nix) {});

    isDesktop = hostName == "desktop";
    isLaptop = hostName == "laptop";
    isServer = hostName == "server";
  in
    nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {inherit inputs hostName username homeDir isDesktop isLaptop isServer;};

      modules =
        [
          {nixpkgs.overlays = overlays ++ optional (packages != []) packageOverlay;}
          home-manager.nixosModules.home-manager

          {
            home-manager = {
              useUserPackages = true;
              backupFileExtension = "backup";
              extraSpecialArgs = {inherit inputs system username homeDir isDesktop isLaptop isServer;};
            };
          }
        ]
        ++ filter (hasSuffix ".nix") (listFilesRecursive (self + /hosts/${hostName}))
        ++ flatten (map (moduleDir: filter (hasSuffix ".nix") (listFilesRecursive (self + /modules/${moduleDir}))) modules);
    };
in {
  _module.args.mkNixos = mkNixos;
}
