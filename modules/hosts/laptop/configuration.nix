{ inputs, ... }:
{
  flake =
    { lib, ... }@flake:
    let
      inherit (lib) nixosSystem;
      inherit (lib.lists) singleton;
    in
    {
      nixosConfigurations.laptop = nixosSystem {
        modules = singleton (
          {
            lib,
            modulesPath,
            config,
            keys,
            username,
            pkgs,
            ...
          }:
          let
            inherit (lib.attrsets) attrValues;
          in
          {
            imports =
              attrValues {
                inherit (flake.config.modules.nixos)
                  audio
                  bluetooth
                  core
                  fonts
                  gdm
                  ghostty
                  graphics
                  helix
                  home-manager
                  keyring
                  loader
                  locale
                  networking
                  niri
                  nix
                  nix-index
                  noctalia
                  nushell
                  printing
                  ragenix
                  ssh
                  stylix
                  tailscale
                  thunar
                  users
                  yubikey
                  ;
              }
              ++ [
                (modulesPath + "/installer/scan/not-detected.nix")
                inputs.nixos-hardware.nixosModules.framework-13-7040-amd
              ];

            _module.args = {
              hostName = "laptop";
              username = "onat";
            };

            nixpkgs.hostPlatform.system = "x86_64-linux";

            boot = {
              kernelModules = [ "kvm-amd" ];

              initrd.availableKernelModules = [
                "nvme"
                "xhci_pci"
                "thunderbolt"
                "usb_storage"
                "sd_mod"
              ];
            };

            fileSystems = {
              "/" = {
                device = "/dev/disk/by-uuid/506db6ea-c537-4c30-a710-1aafaef3cf8a";
                fsType = "ext4";
              };

              "/boot" = {
                device = "/dev/disk/by-uuid/CB13-7E41";
                fsType = "vfat";

                options = [
                  "fmask=0077"
                  "dmask=0077"
                ];
              };
            };

            swapDevices = [ { device = "/dev/disk/by-uuid/f2ce709b-e968-4dbd-b4ce-f8b6f8b81afd"; } ];

            hardware = {
              cpu.amd.updateMicrocode = config.hardware.enableRedistributableFirmware;
              framework.enableKmod = true;
            };

            users.users = {
              root.openssh.authorizedKeys.keys = keys.ssh.users.admins;

              ${username} = {
                openssh.authorizedKeys.keys = keys.ssh.users.admins;

                extraGroups = [
                  "networkmanager"
                  "storage"
                  "video"
                  "wheel"
                ];
              };
            };

            services = {
              fwupd.enable = true;
              power-profiles-daemon.enable = true;
              upower.enable = true;
            };

            environment.systemPackages = [
              pkgs.framework-tool
              pkgs.kmod
              pkgs.microcode-amd
            ];

            home-manager.sharedModules = attrValues {
              inherit (flake.config.modules.homeManager)
                bash
                bat
                carapace
                cli
                cursor
                direnv
                eza
                fastfetch
                fish
                gh
                git
                helium
                jujutsu
                media
                nh
                nix-tools
                obsidian
                proton
                starship
                swayidle
                tmux
                tui
                wayland
                wayvnc
                wl-clipboard
                xdg
                xwayland
                zathura
                zmkbatx
                zoxide
                zsh
                ;
            };
          }
        );
      };
    };
}
