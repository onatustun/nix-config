{
  pkgs,
  ...
}: {
  environment = {
    gnome.excludePackages = with pkgs; [
      atomix
      cheese
      epiphany 
      evince 
      geary 
      gedit
      gnome-characters
      gnome-music
      gnome-photos
      gnome-terminal
      gnome-tour
      hitori
      iagno
      tali
      totem
      gnome-console
      xterm
    ];

    systemPackages = with pkgs; [
      gnomeExtensions.appindicator
      gnomeExtensions.arcmenu
      gnomeExtensions.paperwm
      gnomeExtensions.blur-my-shell
      gnomeExtensions.gsconnect
      gnomeExtensions.just-perfection
      gnomeExtensions.space-bar
      gnomeExtensions.bluetooth-battery
      gnomeExtensions.vitals
      gnomeExtensions.dash-to-panel
      dconf2nix
      dconf-editor
      xdg-desktop-portal-gnome
    ];
  };

  services.xserver = {
    enable = true;

    desktopManager = { 
      plasma6.enable = true;

      gnome = {
        enable = true;
        extraGSettingsOverridePackages = [ pkgs.mutter ];
        extraGSettingsOverrides = ''
          [org.gnome.mutter]
          experimental-features=['scale-monitor-framebuffer']
        '';
      };
    };

    displayManager.gdm = {
      enable = true;
      wayland = true;
    };
  };
}
