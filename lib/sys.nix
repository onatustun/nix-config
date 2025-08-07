inputs: self: super: let
  inherit (super) nixosSystem darwinSystem makeSystemConfig nixOnDroidConfiguration;

  mkSystem = systemBuilder: {
    hostName,
    system ?
      if systemBuilder == darwinSystem
      then "aarch64-darwin"
      else if systemBuilder == nixOnDroidConfiguration
      then "aarch64-linux"
      else "x86_64-linux",
    username ? "onat",
    homeVer ? null,
    packages ? [],
    overlays ? [],
    inputModules ? [],
    modules ? [],
    ignore ? [],
  }: let
    inherit (self) collectNix;

    homeDir =
      if systemBuilder == darwinSystem
      then "/Users/${username}"
      else "/home/${username}";

    hostTypes = {
      isDesktop = hostName == "desktop";
      isLaptop = hostName == "laptop";
      isServer = hostName == "server";
      isWsl = hostName == "wsl";

      isNixos = systemBuilder == nixosSystem;
      isDarwin = systemBuilder == darwinSystem;
      isLinux = systemBuilder == makeSystemConfig;
      isDroid = systemBuilder == nixOnDroidConfiguration;
    };

    packageOverlay = let
      inherit (super) genAttrs;
    in
      final: prev:
        genAttrs packages (name:
          final.callPackage (inputs.self + /pkgs/${name}.nix) {});

    filterIgnored = let
      inherit (super) filter;
      inherit (builtins) elem;
    in
      files:
        filter (file:
          !(elem (baseNameOf (toString file)) (map (name: "${name}.nix") ignore)))
        files;

    processModules = let
      inherit (super) strings flatten splitString;
      inherit (strings) hasInfix;
    in
      modules:
        flatten (map (module:
          if hasInfix "/" module
          then let
            inherit (builtins) head elemAt;
            parts = splitString "/" module;
          in
            inputs.self + /modules/${head parts}/${elemAt parts 1}.nix
          else
            collectNix (inputs.self + /modules/${module})
            |> filterIgnored)
        modules);

    specialArgs =
      inputs
      // hostTypes
      // {
        inherit inputs system systemBuilder hostName username homeDir homeVer;
        lib = self;
      };

    baseModules =
      [
        {
          nixpkgs = {
            hostPlatform = let
              inherit (super) mkDefault;
            in
              mkDefault system;

            overlays = let
              inherit (super) optional;
            in
              overlays
              ++ optional (packages != []) packageOverlay;
          };
        }
      ]
      ++ collectNix (inputs.self + /hosts/${hostName})
      ++ processModules modules;

    homeManagerModule = let
      inherit (super) optionals;
    in
      optionals (homeVer != null) [
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
      inherit specialArgs system;

      modules =
        baseModules
        ++ homeManagerModule
        ++ inputModules;
    };
in {
  mkNixos = mkSystem nixosSystem;
  mkDarwin = mkSystem darwinSystem;
  mkLinux = mkSystem makeSystemConfig;
  mkDroid = mkSystem nixOnDroidConfiguration;
}
