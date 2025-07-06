{
  lib,
  inputs,
  ...
}: let
  inherit (inputs) self nixpkgs home-manager;
  inherit (lib) genAttrs optional filter hasSuffix flatten optionals;
  inherit (lib.filesystem) listFilesRecursive;

  mkNixos = {
    hostName,
    system,
    username,
    homeVer ? null,
    packages ? [],
    overlays ? [],
    extraInputs ? [],
    modules,
  }: let
    homeDir = "/home/${username}";
    packageOverlay = final: prev: genAttrs packages (name: final.callPackage (self + /pkgs/${name}.nix) {});

    isDesktop = hostName == "desktop";
    isLaptop = hostName == "laptop";
    isServer = hostName == "server";

    homeManagerModules = optionals (homeVer != null) [
      home-manager.nixosModules.home-manager

      {
        home-manager = {
          users.${username}.home.stateVersion = homeVer;
          useUserPackages = true;
          backupFileExtension = "backup";
          extraSpecialArgs = {inherit inputs system username homeDir isDesktop isLaptop isServer;};
        };
      }
    ];
  in
    nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {inherit inputs hostName username homeDir isDesktop isLaptop isServer homeVer;};

      modules =
        [
          {nixpkgs.overlays = overlays ++ optional (packages != []) packageOverlay;}
        ]
        ++ extraInputs
        ++ homeManagerModules
        ++ filter (hasSuffix ".nix") (listFilesRecursive (self + /hosts/nixos/${hostName}))
        ++ flatten (map (moduleDir: filter (hasSuffix ".nix") (listFilesRecursive (self + /modules/${moduleDir}))) modules);
    };
in {
  _module.args.mkNixos = mkNixos;
}
