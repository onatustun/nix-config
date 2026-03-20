{
  flake.nixosModules = {
    cli = {
      lib,
      self,
      ...
    }: {
      home-manager.sharedModules = lib.lists.singleton self.homeModules.cli;
    };

    desktop = {
      lib,
      self,
      ...
    }: {
      imports = lib.attrsets.attrValues (lib.attrsets.getAttrs [
          "gui"
          "wayland"
        ]
        self.nixosModules);
    };

    gui = {
      lib,
      self,
      ...
    }: {
      home-manager.sharedModules = lib.lists.singleton self.homeModules.gui;
    };

    shells = {
      lib,
      self,
      ...
    }: {
      home-manager.sharedModules = lib.lists.singleton self.homeModules.shells;
    };

    system = {
      lib,
      self,
      ...
    }: {
      imports = lib.attrsets.attrValues (lib.attrsets.getAttrs [
          "boot"
          "hardware"
          "network"
          "nix"
          "security"
        ]
        self.nixosModules);
    };

    terminal = {
      lib,
      self,
      ...
    }: {
      imports = lib.attrsets.attrValues (lib.attrsets.getAttrs [
          "cli"
          "shells"
          "tui"
        ]
        self.nixosModules);
    };

    tui = {
      lib,
      self,
      ...
    }: {
      home-manager.sharedModules = lib.lists.singleton self.homeModules.tui;
    };

    wayland = {
      lib,
      self,
      ...
    }: {
      home-manager.sharedModules = lib.lists.singleton self.homeModules.wayland;
    };
  };
}
