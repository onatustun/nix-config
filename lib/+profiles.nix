{
  flake.modules.nixos = {
    cli = {
      lib,
      self,
      ...
    }: {
      home-manager.sharedModules = lib.lists.singleton self.modules.homeManager.cli;
    };

    desktop = {
      lib,
      self,
      type,
      ...
    }: {
      imports = lib.lists.map (module: self.modules.${type}.${module}) [
        "gui"
        "wayland"
      ];
    };

    gui = {
      lib,
      self,
      ...
    }: {
      home-manager.sharedModules = lib.lists.singleton self.modules.homeManager.gui;
    };

    shells = {
      lib,
      self,
      ...
    }: {
      home-manager.sharedModules = lib.lists.singleton self.modules.homeManager.shells;
    };

    system = {
      lib,
      self,
      type,
      ...
    }: {
      imports = lib.lists.map (module: self.modules.${type}.${module}) [
        "boot"
        "hardware"
        "network"
        "nix"
        "security"
      ];
    };

    terminal = {
      lib,
      self,
      type,
      ...
    }: {
      imports = lib.lists.map (module: self.modules.${type}.${module}) [
        "cli"
        "shells"
        "tui"
      ];
    };

    tui = {
      lib,
      self,
      ...
    }: {
      home-manager.sharedModules = lib.lists.singleton self.modules.homeManager.tui;
    };

    wayland = {
      lib,
      self,
      ...
    }: {
      home-manager.sharedModules = lib.lists.singleton self.modules.homeManager.wayland;
    };
  };
}
