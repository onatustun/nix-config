{
  programs.niri.settings = {
    window-rules = [
      {
        clip-to-geometry = true;
        draw-border-with-background = false;

        geometry-corner-radius = let
          radius = 4.0;
        in {
          bottom-left = radius;
          bottom-right = radius;
          top-left = radius;
          top-right = radius;
        };
      }
    ];
  };
}
