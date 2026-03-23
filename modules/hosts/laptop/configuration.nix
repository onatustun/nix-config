{
  lib,
  inputs,
  keys,
  self,
  ...
}: {
  flake.nixosConfigurations.laptop = lib.nixosSystem {
    specialArgs = {
      inherit inputs keys;
      hostName = "laptop";
      username = "onat";
    };

    modules =
      lib.attrsets.attrValues (lib.attrsets.getAttrs [
          "audio"
          "bluetooth"
          "core"
          "fonts"
          "gdm"
          "ghostty"
          "graphics"
          "helix"
          "home-manager"
          "kernel"
          "keyring"
          "laptop-hardware"
          "laptop-host"
          "loader"
          "locale"
          "networking"
          "niri"
          "nix-core"
          "nix-index"
          "nixpkgs"
          "noctalia"
          "nur"
          "nushell"
          "ragenix"
          "scx"
          "security-core"
          "ssh"
          "stylix"
          "tailscale"
          "thunar"
          "users"
          "yubikey"
          "zen-browser"
        ]
        self.nixosModules)
      ++ lib.lists.singleton ({
        lib,
        inputs,
        ...
      }: {
        home-manager.sharedModules = lib.attrsets.attrValues (lib.attrsets.getAttrs [
            "archivers"
            "bash"
            "bat"
            "carapace"
            "cli-nix"
            "cli-utils"
            "cursor"
            "direnv"
            "eza"
            "fastfetch"
            "fish"
            "gh"
            "git"
            "jujutsu"
            "laptop-hm"
            "media"
            "nh"
            "obsidian"
            "proton"
            "soulseek"
            "starship"
            "swayidle"
            "tmux"
            "tui-utils"
            "wayland-utils"
            "wayvnc"
            "wl-clipboard"
            "xdg"
            "xwayland"
            "yazi"
            "zathura"
            "zmkbatx"
            "zoxide"
            "zsh"
          ]
          inputs.self.homeModules);
      });
  };
}
