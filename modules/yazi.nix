{
  flake.homeModules.yazi.programs.yazi = {
    enable = true;
    shellWrapperName = "y";

    settings = {
      mgr = {
        layout = [
          1
          4
          3
        ];

        sort_by = "alphabetical";
        sort_sensitive = true;
        sort_reverse = false;
        sort_dir_first = true;
        linemode = "none";
        show_hidden = false;
        show_symlink = true;
      };

      preview = {
        tab_size = 2;
        max_width = 600;
        max_height = 900;
      };
    };
  };
}
