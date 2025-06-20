{
  programs.niri.settings = {
    layout = {
      always-center-single-column = true;
      center-focused-column = "on-overflow";
      default-column-width = {proportion = 0.5;};
      gaps = 8;

      border = {
        enable = true;
        width = 2;
      };

      preset-window-heights = [
        {proportion = 1.0 / 3.0;}
        {proportion = 1.0 / 2.0;}
        {proportion = 1.0 / 1.5;}
      ];

      preset-column-widths = [
        {proportion = 1.0 / 3.0;}
        {proportion = 1.0 / 2.0;}
        {proportion = 1.0 / 1.5;}
      ];

      struts = {
        left = 8;
        bottom = 8;
        top = 8;
        right = 8;
      };
    };
  };
}
