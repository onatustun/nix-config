{
  flake =
    { lib, ... }@flake:
    let
      inherit (lib) nixosSystem;
      inherit (lib.lists) singleton;
    in
    {
      nixosConfigurations.desktop = nixosSystem {
        modules = singleton (
          {
            lib,
            modulesPath,
            config,
            keys,
            username,
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
              ++ [ (modulesPath + "/installer/scan/not-detected.nix") ];

            _module.args = {
              hostName = "desktop";
              username = "onat";
            };

            nixpkgs.hostPlatform.system = "x86_64-linux";

            boot = {
              kernelModules = [ "kvm-intel" ];

              initrd.availableKernelModules = [
                "xhci_pci"
                "ahci"
                "usb_storage"
                "sd_mod"
              ];
            };

            fileSystems = {
              "/" = {
                device = "/dev/disk/by-uuid/ab2dc6ee-7ca5-4306-80da-43255fabdd75";
                fsType = "ext4";
              };

              "/boot" = {
                device = "/dev/disk/by-uuid/86F4-D550";
                fsType = "vfat";

                options = [
                  "fmask=0077"
                  "dmask=0077"
                ];
              };
            };

            swapDevices = [ { device = "/dev/disk/by-uuid/f21c6765-340e-4bbd-8a13-d902376a5430"; } ];

            hardware = {
              cpu.intel.updateMicrocode = config.hardware.enableRedistributableFirmware;

              nvidia = {
                modesetting.enable = true;
                open = false;
                package = config.boot.kernelPackages.nvidiaPackages.beta;
              };
            };

            services.xserver.videoDrivers = [ "nvidia" ];

            users.users = {
              root.openssh.authorizedKeys.keys = keys.ssh.users.admins;

              ${username} = {
                openssh.authorizedKeys.keys = keys.ssh.users.admins;

                extraGroups = [
                  "networkmanager"
                  "storage"
                  "wheel"
                ];
              };
            };

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
                yazi
                zathura
                zoxide
                zsh
                ;
            };
          }
        );
      };
    };
}
