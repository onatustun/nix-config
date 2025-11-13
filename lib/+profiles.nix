{
  flake.modules = {
    nixos = {
      cli = {self, ...}: {
        imports = [self.modules.nixos.nix-index];
        home-manager.sharedModules = [self.modules.homeManager.cli];
      };

      compositors = {self, ...}: {
        imports = [
          self.modules.nixos.hyprland
          self.modules.nixos.niri
        ];
      };

      desktop = {self, ...}: {
        imports = [
          self.modules.nixos.gui
          self.modules.nixos.wayland
        ];

        home-manager.sharedModules = [
          self.modules.homeManager.cursor
          self.modules.homeManager.rofi
        ];
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

      network = {self, ...}: {
        imports = [
          self.modules.nixos.networking
          self.modules.nixos.ssh
          self.modules.nixos.tailscale
        ];
      };

      nix = {self, ...}: {
        imports = [
          self.modules.nixos.nix-core
          self.modules.nixos.nixpkgs
          self.modules.nixos.nur
          self.modules.nixos.substituters
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
          self.modules.nixos.kernel
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
          self.modules.nixos.shells
        ];

        home-manager.sharedModules = [
          self.modules.homeManager.emulators
          self.modules.homeManager.tui
        ];
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
          self.modules.homeManager.cli-core
          self.modules.homeManager.cli-nix
          self.modules.homeManager.deadnix
          self.modules.homeManager.eza
          self.modules.homeManager.fastfetch
          self.modules.homeManager.gh
          self.modules.homeManager.git
          self.modules.homeManager.nh
          self.modules.homeManager.zoxide
        ];
      };

      emulators = {self, ...}: {
        imports = [self.modules.homeManager.ghostty];
      };

      gui = {self, ...}: {
        imports = [
          self.modules.homeManager.discord
          self.modules.homeManager.github
          self.modules.homeManager.media
          self.modules.homeManager.obsidian
          self.modules.homeManager.proton
          self.modules.homeManager.soulseek
          self.modules.homeManager.zathura
          self.modules.homeManager.zen
        ];
      };

      shells = {self, ...}: {
        imports = [
          self.modules.homeManager.bash
          self.modules.homeManager.carapace
          self.modules.homeManager.direnv
          self.modules.homeManager.fish
          self.modules.homeManager.starship
          self.modules.homeManager.zsh
        ];
      };

      tui = {self, ...}: {
        imports = [
          self.modules.homeManager.helix
          self.modules.homeManager.lazygit
          self.modules.homeManager.scooter
          self.modules.homeManager.tmux
          self.modules.homeManager.yazi
        ];
      };

      wayland = {self, ...}: {
        imports = [
          self.modules.homeManager.dunst
          self.modules.homeManager.hyprcursor
          self.modules.homeManager.swayidle
          self.modules.homeManager.swaylock
          self.modules.homeManager.waybar
          self.modules.homeManager.wayland-core
          self.modules.homeManager.wl-clipboard
          self.modules.homeManager.wlogout
          self.modules.homeManager.wlsunset
          self.modules.homeManager.xwayland
        ];
      };
    };
  };
}
