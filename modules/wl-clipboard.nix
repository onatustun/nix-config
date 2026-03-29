{
  flake.homeModules.wl-clipboard =
    { pkgs, ... }:
    {
      services = {
        cliphist.enable = true;
        wl-clip-persist.enable = true;
      };

      programs.helix.settings.editor.clipboard-provider = "wayland";
      home.packages = [ pkgs.wl-clipboard ];
    };
}
