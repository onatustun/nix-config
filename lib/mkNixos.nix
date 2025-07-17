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
    inherit (inputs) nixpkgs self;
    inherit (nixpkgs.lib) nixosSystem;
    inherit (lib) genAttrs filter flatten splitString optional hasSuffix optionals;
    inherit (builtins) elem head elemAt pathExists;
    inherit (lib.strings) hasInfix;
    inherit (lib.filesystem) listFilesRecursive;

    homeDir = "/home/${username}";
    packageOverlay = final: prev: genAttrs packages (name: final.callPackage (self + /pkgs/${name}.nix) {});
    filterIgnored = files: filter (file: let fileName = baseNameOf (toString file); in !(elem fileName (map (name: "${name}.nix") ignore))) files;

    hostTypes = {
      isDesktop = hostName == "desktop";
      isLaptop = hostName == "laptop";
      isServer = hostName == "server";
      isWsl = hostName == "wsl";
    };

    processModules = modules:
      flatten (map (module:
        if hasInfix "/" module
        then let
          parts = splitString "/" module;
          modulePath = self + /modules/${head parts}/${elemAt parts 1}.nix;
        in
          optional (pathExists modulePath) modulePath
        else self + /modules/${module} |> listFilesRecursive |> filter (hasSuffix ".nix") |> filterIgnored)
      modules);
  in
    nixosSystem {
      inherit system;
      specialArgs = {inherit inputs hostName username homeDir homeVer;} // hostTypes;

      modules =
        []
        ++ [{nixpkgs.overlays = overlays ++ optional (packages != []) packageOverlay;}]
        ++ (listFilesRecursive (self + /hosts/nixos/${hostName}) |> filter (hasSuffix ".nix"))
        ++ processModules modules
        ++ optionals (homeVer != null) [
          inputs.home-manager.nixosModules.home-manager

          {
            home-manager = {
              users.${username}.home.stateVersion = homeVer;
              useUserPackages = true;
              backupFileExtension = "backup";
              extraSpecialArgs = {inherit inputs system username homeDir homeVer;} // hostTypes;
            };
          }
        ];
    };
}
