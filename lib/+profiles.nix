{
  flake.modules = {
    nixos = {
      cli = {self, ...}: {
        imports = [self.modules.nixos.nix-index];
        home-manager.sharedModules = [self.modules.homeManager.cli];
      };

      desktop = {self, ...}: {
        imports = [
          self.modules.nixos.gui
          self.modules.nixos.wayland
        ];

        home-manager.sharedModules = [self.modules.homeManager.cursor];
      };

      gui = {self, ...}: {
        imports = [self.modules.nixos.thunar];
        home-manager.sharedModules = [self.modules.homeManager.gui];
      };

      hardware = {self, ...}: {
        imports = [
          self.modules.nixos.audio
          self.modules.nixos.bluetooth
          self.modules.nixos.graphics
        ];
      };

      nix = {self, ...}: {
        imports = [
          self.modules.nixos.chaotic
          self.modules.nixos.nix-core
          self.modules.nixos.nixpkgs
          self.modules.nixos.nur
        ];
      };

      security = {self, ...}: {
        imports = [
          self.modules.nixos.security-core
          self.modules.nixos.keyring
          self.modules.nixos.ragenix
          self.modules.nixos.yubikey
        ];
      };

      shells = {self, ...}: {
        imports = [self.modules.nixos.nushell];
        home-manager.sharedModules = [self.modules.homeManager.shells];
      };

      system = {self, ...}: {
        imports = [
          self.modules.nixos.boot
          self.modules.nixos.hardware
          self.modules.nixos.locale
          self.modules.nixos.network
          self.modules.nixos.nix
          self.modules.nixos.security
          self.modules.nixos.users
        ];

        home-manager.sharedModules = [self.modules.homeManager.xdg];
      };

      terminal = {self, ...}: {
        imports = [
          self.modules.nixos.cli
          self.modules.nixos.ghostty
          self.modules.nixos.shells
          self.modules.nixos.tui
        ];
      };

      tui = {self, ...}: {
        imports = [self.modules.nixos.helix];
        home-manager.sharedModules = [self.modules.homeManager.tui];
      };

      ui = {self, ...}: {
        imports = [
          self.modules.nixos.fonts
          self.modules.nixos.stylix
        ];
      };

      wayland = {self, ...}: {
        imports = [self.modules.nixos.gdm];
        home-manager.sharedModules = [self.modules.homeManager.wayland];
      };
    };

    homeManager = {
      cli = {self, ...}: {
        imports = [
          self.modules.homeManager.archivers
          self.modules.homeManager.bat
          self.modules.homeManager.cli-nix
          self.modules.homeManager.cli-utils
          self.modules.homeManager.eza
          self.modules.homeManager.fastfetch
          self.modules.homeManager.gh
          self.modules.homeManager.git
          self.modules.homeManager.jujutsu
          self.modules.homeManager.nh
          self.modules.homeManager.zoxide
        ];
      };
    };
  };
}
