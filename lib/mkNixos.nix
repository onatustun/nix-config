{
  inputs,
  lib,
  ...
}: {
  _module.args.mkNixos = {
    hostName,
    system ? "x86_64-linux",
    username ? "onat",
    homeVer ? null,
    packages ? [],
    overlays ? [],
    modules ? [],
    ignore ? [],
  }: let
    inherit (inputs) nixpkgs;
    inherit (lib) genAttrs filter optional optionals hasSuffix flatten;
    inherit (lib.filesystem) listFilesRecursive;
    inherit (lib.strings) hasInfix;

    homeDir = "/home/${username}";
    packageOverlay = final: prev: genAttrs packages (name: final.callPackage (inputs.self + /pkgs/${name}.nix) {});
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
          modulePath = inputs.self + /modules/${moduleDir}/${moduleName}.nix;
        in
          if builtins.pathExists modulePath
          then [modulePath]
          else []
        else filterIgnored (filter (hasSuffix ".nix") (listFilesRecursive (inputs.self + /modules/${module}))))
      modules);
  in
    nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {inherit inputs hostName username homeDir isDesktop isLaptop isServer isWsl homeVer;};

      modules =
        []
        ++ [{nixpkgs.overlays = overlays ++ optional (packages != []) packageOverlay;}]
        ++ filter (hasSuffix ".nix") (listFilesRecursive (inputs.self + /hosts/nixos/${hostName}))
        ++ processModules modules
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
        ];
    };
}
