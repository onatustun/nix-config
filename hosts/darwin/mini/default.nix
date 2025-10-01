lib: inputs:
lib.darwinSystem' {
  hostName = "mini";
  system = "aarch64-darwin";
  username = "onat";
  stateVer = 6;
  homeVer = "24.11";
  overlays = [inputs.nuenv.overlays.default];

  inputModules = [
    inputs.home-manager.darwinModules.default
    inputs.nix-index-database.darwinModules.nix-index
    inputs.stylix.darwinModules.stylix
  ];

  modules = [
    "common"
    "darwin"
  ];

  ignore = [
    "discord.nix"
    "zen.nix"
  ];

  module = {
    lib,
    username,
    ...
  }: let
    inherit (lib) adminUserKeys;
  in {
    nix.enable = false;

    users.users = {
      root.openssh.authorizedKeys.keys = adminUserKeys;
      ${username}.openssh.authorizedKeys.keys = adminUserKeys;
    };
  };
}
