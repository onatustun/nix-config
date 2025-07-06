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
    modules,
    ignore ? [],
  }: let
    homeDir = "/home/${username}";
    packageOverlay = final: prev: genAttrs packages (name: final.callPackage (self + /pkgs/${name}.nix) {});

    isDesktop = hostName == "desktop";
    isLaptop = hostName == "laptop";
    isServer = hostName == "server";
    isWsl = hostName == "wsl";

    homeManagerModules = optionals (homeVer != null) [
      home-manager.nixosModules.home-manager

      {
        home-manager = {
          users.${username}.home.stateVersion = homeVer;
          useUserPackages = true;
          backupFileExtension = "backup";
          extraSpecialArgs = {inherit inputs system username homeDir isDesktop isLaptop isServer isWsl;};
        };
      }
    ];

    filterIgnored = files:
      filter (
        file: let
          fileName = baseNameOf (toString file);
        in
          !(builtins.elem fileName (map (name: "${name}.nix") ignore))
      )
      files;
  in
    nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {inherit inputs hostName username homeDir isDesktop isLaptop isServer isWsl homeVer;};

      modules =
        [
          {nixpkgs.overlays = overlays ++ optional (packages != []) packageOverlay;}
        ]
        ++ homeManagerModules
        ++ filter (hasSuffix ".nix") (listFilesRecursive (self + /hosts/nixos/${hostName}))
        ++ flatten (map (
            moduleDir:
              filterIgnored (filter (hasSuffix ".nix") (listFilesRecursive (self + /modules/${moduleDir})))
          )
          modules);
    };
in {
  _module.args.mkNixos = mkNixos;
}
