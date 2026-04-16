{
  flake.modules.homeManager.wl-clipboard =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.wl-clipboard ];

      services = {
        cliphist.enable = true;
        wl-clip-persist.enable = true;
      };

      programs.helix.settings.editor.clipboard-provider = "wayland";
    };
}
