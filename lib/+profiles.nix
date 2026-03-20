{
  flake.nixosModules = {
    cli = {
      lib,
      inputs,
      ...
    }: {
      home-manager.sharedModules = lib.lists.singleton inputs.self.homeModules.cli;
    };

    desktop = {
      lib,
      inputs,
      ...
    }: {
      imports = lib.attrsets.attrValues (lib.attrsets.getAttrs [
          "gui"
          "wayland"
        ]
        inputs.self.nixosModules);
    };

    gui = {
      lib,
      inputs,
      ...
    }: {
      home-manager.sharedModules = lib.lists.singleton inputs.self.homeModules.gui;
    };

    shells = {
      lib,
      inputs,
      ...
    }: {
      home-manager.sharedModules = lib.lists.singleton inputs.self.homeModules.shells;
    };

    system = {
      lib,
      inputs,
      ...
    }: {
      imports = lib.attrsets.attrValues (lib.attrsets.getAttrs [
          "boot"
          "hardware"
          "network"
          "nix"
          "security"
        ]
        inputs.self.nixosModules);
    };

    terminal = {
      lib,
      inputs,
      ...
    }: {
      imports = lib.attrsets.attrValues (lib.attrsets.getAttrs [
          "cli"
          "shells"
          "tui"
        ]
        inputs.self.nixosModules);
    };

    tui = {
      lib,
      inputs,
      ...
    }: {
      home-manager.sharedModules = lib.lists.singleton inputs.self.homeModules.tui;
    };

    wayland = {
      lib,
      inputs,
      ...
    }: {
      home-manager.sharedModules = lib.lists.singleton inputs.self.homeModules.wayland;
    };
  };
}
