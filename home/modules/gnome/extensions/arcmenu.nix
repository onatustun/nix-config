{ 
  lib,
  ... 
}: with lib.hm.gvariant; {
  dconf.settings."org/gnome/shell/extensions/arcmenu" = {
    arcmenu-hotkey = ["<Super>D"];
    highlight-search-result-terms = false;
    menu-layout = "Runner";
    multi-monitor = false;
    override-menu-theme = false;
    position-in-panel = "Center";
    prefs-visible-page = 0;
    runner-font-size = 14;
    runner-menu-height = 445;
    runner-menu-width = 545;
    runner-position = "Centered";
    runner-search-display-style = "List";
    runner-show-frequent-apps = true;
    search-entry-border-radius = mkTuple [ true 25 ];
    search-provider-open-windows = false;
    show-category-sub-menus = false;
    show-search-result-details = false;
  };
}
