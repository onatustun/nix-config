{
  flake.homeModules.wl-clipboard = {pkgs, ...}: {
    services.cliphist.enable = true;
    programs.helix.settings.editor.clipboard-provider = "wayland";

    home.packages = [
      pkgs.cliphist
      pkgs.wl-clipboard
      pkgs.wl-clip-persist
    ];
  };
}
