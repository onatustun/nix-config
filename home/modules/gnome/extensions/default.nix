{ 
  pkgs,
  ... 
}: {
  imports = [
    ./arcmenu.nix
    ./paperwm.nix
    ./blur-my-shell.nix
    ./dash-to-panel.nix
  ];

  dconf.settings = {
    "org/gnome/shell" = {
      disable-user-extensions = false;
      disabled-extensions = [];
      
      enabled-extensions = with pkgs.gnomeExtensions; [ 
        appindicator.extensionUuid
        arcmenu.extensionUuid
        bluetooth-battery.extensionUuid
        blur-my-shell.extensionUuid
        dash-to-panel.extensionUuid
        gsconnect.extensionUuid
        just-perfection.extensionUuid
        paperwm.extensionUuid
        space-bar.extensionUuid
        vitals.extensionUuid
      ];
    };

    "org/gnome/shell/extensions/just-perfection".animation = 2;
    "org/gnome/shell/extensions/space-bar/behavior".show-empty-workspaces = false; 
    "org/gnome/shell/extensions/vitals".menu-centered = true;
  };
}
