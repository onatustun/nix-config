inputs: self: super: let
  inherit (super) nixosSystem darwinSystem;

  mkSystem = systemBuilder: {
    hostName,
    system ?
      if systemBuilder == darwinSystem
      then "aarch64-darwin"
      else "x86_64-linux",
    username ? "onat",
    homeVer ? null,
    packages ? [],
    overlays ? [],
    modules ? [],
    ignore ? [],
  }: let
    inherit (super) genAttrs filter flatten splitString optional hasSuffix optionals;
    inherit (builtins) elem head elemAt pathExists;
    inherit (super.strings) hasInfix;
    inherit (super.filesystem) listFilesRecursive;

    homeDir =
      if systemBuilder == darwinSystem
      then "/Users/${username}"
      else "/home/${username}";

    packageOverlay = final: prev: genAttrs packages (name: final.callPackage (inputs.self + /pkgs/${name}.nix) {});
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
          modulePath = inputs.self + /modules/${head parts}/${elemAt parts 1}.nix;
        in
          optional (pathExists modulePath) modulePath
        else inputs.self + /modules/${module} |> listFilesRecursive |> filter (hasSuffix ".nix") |> filterIgnored)
      modules);

    specialArgs =
      inputs
      // hostTypes
      // {
        inherit inputs system hostName username homeDir homeVer;
        lib = self;
      };

    baseModules =
      [{nixpkgs.overlays = overlays ++ optional (packages != []) packageOverlay;}]
      ++ (inputs.self + /hosts/${hostName} |> listFilesRecursive |> filter (hasSuffix ".nix"))
      ++ processModules modules;

    homeManagerModule = optionals (homeVer != null) [
      (
        if systemBuilder == darwinSystem
        then inputs.home-manager.darwinModules.home-manager
        else inputs.home-manager.nixosModules.home-manager
      )

      {
        home-manager = {
          users.${username}.home.stateVersion = homeVer;
          useUserPackages = true;
          backupFileExtension = "backup";
          extraSpecialArgs = specialArgs;
        };
      }
    ];
  in
    systemBuilder {
      inherit specialArgs;
      modules = baseModules ++ homeManagerModule;
    };
in {
  mkNixos = mkSystem nixosSystem;
  mkDarwin = mkSystem darwinSystem;
}
