{
  lib,
  inputs,
  ...
}: let
  inherit (inputs) self nixpkgs;
  inherit (lib) genAttrs optional filter hasSuffix flatten;
  inherit (lib.filesystem) listFilesRecursive;

  mkNixos = {
    hostName,
    system,
    username,
    modules,
    overlays ? [],
    packages ? [],
    home-manager ? null,
  }: let
    homeDir = "/home/${username}";
    packageOverlay = final: prev: genAttrs packages (name: final.callPackage (self + /pkgs/${name}.nix) {});

    isDesktop = hostName == "desktop";
    isLaptop = hostName == "laptop";
    isServer = hostName == "server";

    homeManagerModules = optional (home-manager != null) [
      home-manager.nixosModules.home-manager
      {
        home-manager = {
          useUserPackages = true;
          backupFileExtension = "backup";
          extraSpecialArgs = {inherit inputs system username homeDir isDesktop isLaptop isServer;};
        };
      }
    ];
  in
    nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {inherit inputs hostName username homeDir isDesktop isLaptop isServer;};

      modules =
        [
          {nixpkgs.overlays = overlays ++ optional (packages != []) packageOverlay;}
        ]
        ++ homeManagerModules
        ++ filter (hasSuffix ".nix") (listFilesRecursive (self + /hosts/nixos/${hostName}))
        ++ flatten (map (moduleDir: filter (hasSuffix ".nix") (listFilesRecursive (self + /modules/${moduleDir}))) modules);
    };
in {
  _module.args.mkNixos = mkNixos;
}
