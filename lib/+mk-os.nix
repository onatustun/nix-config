{
  self,
  lib,
  inputs,
  withSystem,
  ...
}: let
  systems = {
    nixos = {
      platform = "x86_64-linux";
      input = "nixpkgs";
      homePrefix = "home";
    };

    darwin = {
      platform = "aarch64-darwin";
      input = "nix-darwin";
      homePrefix = "Users";
    };
  };

  mk-os = type: hostName: {
    system ? systems.${type}.platform,
    username ? "onat",
    stateVersion ? null,
    homeVersion ? null,
    packages ? [],
    overlays ? [],
    modules ? [],
    hmModules ? [],
    module ? {},
  }: let
    hostPredicates = {
      isDarwin = type == "darwin";
      isNixos = type == "nixos";
      isDesktop = hostName == "desktop";
      isLaptop = hostName == "laptop";
      isMini = hostName == "mini";
      isServer = hostName == "server";
      isWsl = hostName == "wsl";
      isOnat = username == "onat";
    };

    packageOverlay = final:
      lib.const (lib.genAttrs packages (name:
          final.callPackage (self + "/pkgs/${name}.nix") {}));

    overlays' =
      overlays
      ++ lib.optional (packages != []) packageOverlay;

    cfg = systems.${type};
    homeDir = "/${cfg.homePrefix}/${username}";
    secretsDir = self + "/secrets";
    keys = import ./_keys.nix;

    specialArgs =
      inputs
      // hostPredicates
      // {inherit inputs system type hostName username overlays' homeVersion hmModules homeDir secretsDir keys;};
  in {
    "${type}Configurations".${hostName} = inputs.${cfg.input}.lib."${type}System" {
      inherit system specialArgs;
      modules = [self.modules.${type}."host-${hostName}"];
    };

    modules.${type}."host-${hostName}" = {
      system = {inherit stateVersion;};

      _module.args = withSystem system ({
        self',
        inputs',
        ...
      }: {inherit self' inputs';});

      imports =
        modules
        ++ lib.optionals (homeVersion != null) [self.modules.${type}.home-manager]
        ++ [module];
    };
  };
in {
  options.mk-os = lib.mkOption {
    type = lib.types.unspecified;
    default = mk-os;
  };
}
