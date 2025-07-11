{
  inputs,
  lib,
  ...
}: let
  inherit (inputs) self nixpkgs;
  inherit (lib) genAttrs filter optional optionals hasSuffix flatten;
  inherit (lib.filesystem) listFilesRecursive;
  inherit (lib.strings) hasInfix;

  mkNixos = {
    hostName,
    system,
    username,
    homeVer ? null,
    packages ? [],
    overlays ? [],
    modules,
    ignore ? [],
  }: let
    homeDir = "/home/${username}";
    packageOverlay = final: prev: genAttrs packages (name: final.callPackage (self + /pkgs/${name}.nix) {});
    filterIgnored = files: filter (file: let fileName = baseNameOf (toString file); in !(builtins.elem fileName (map (name: "${name}.nix") ignore))) files;

    isDesktop = hostName == "desktop";
    isLaptop = hostName == "laptop";
    isServer = hostName == "server";
    isWsl = hostName == "wsl";

    processModules = modules:
      flatten (map (module:
        if hasInfix "/" module
        then let
          parts = lib.splitString "/" module;
          moduleDir = builtins.head parts;
          moduleName = builtins.elemAt parts 1;
          modulePath = self + /modules/${moduleDir}/${moduleName}.nix;
        in
          if builtins.pathExists modulePath
          then [modulePath]
          else []
        else filterIgnored (filter (hasSuffix ".nix") (listFilesRecursive (self + /modules/${module}))))
      modules);
  in
    nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {inherit inputs hostName username homeDir isDesktop isLaptop isServer isWsl homeVer;};

      modules =
        [
          inputs.determinate.nixosModules.default
          {nixpkgs.overlays = overlays ++ optional (packages != []) packageOverlay;}
        ]
        ++ optionals (homeVer != null) [
          inputs.home-manager.nixosModules.home-manager

          {
            home-manager = {
              users.${username}.home.stateVersion = homeVer;
              useUserPackages = true;
              backupFileExtension = "backup";
              extraSpecialArgs = {inherit inputs system username homeDir isDesktop isLaptop isServer isWsl homeVer;};
            };
          }
        ]
        ++ filter (hasSuffix ".nix") (listFilesRecursive (self + /hosts/nixos/${hostName})) ++ processModules modules;
    };
in {
  _module.args.mkNixos = mkNixos;
}
