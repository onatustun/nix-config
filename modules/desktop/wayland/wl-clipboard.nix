{
  flake.homeModules = {
    wayland = {
      lib,
      self,
      ...
    }: {
      imports = lib.lists.singleton self.homeModules.wl-clipboard;
    };

    wl-clipboard = {pkgs, ...}: {
      home.packages = [
        pkgs.cliphist
        pkgs.wl-clipboard
        pkgs.wl-clip-persist
      ];

      services.cliphist.enable = true;
      programs.helix.settings.editor.clipboard-provider = "wayland";
    };
  };
}
