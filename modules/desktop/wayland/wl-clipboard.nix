{
  flake.modules.homeManager.wl-clipboard = {pkgs, ...}: {
    home.packages = [
      pkgs.cliphist
      pkgs.wl-clipboard
      pkgs.wl-clip-persist
    ];

    services.cliphist.enable = true;
    programs.helix.settings.editor.clipboard-provider = "wayland";
  };
}
