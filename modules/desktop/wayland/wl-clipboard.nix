{
  flake.modules.homeManager.wl-clipboard = {
    inputs',
    pkgs,
    ...
  }: {
    home.packages = [
      inputs'.nixpkgs-wayland.packages.wl-clipboard
      pkgs.wl-clip-persist
    ];

    services.cliphist.enable = true;
    programs.helix.settings.editor.clipboard-provider = "wayland";
  };
}
