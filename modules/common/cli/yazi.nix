{
  inputs,
  pkgs,
  ...
}: {
  home-manager.sharedModules = [
    {
      programs.yazi = {
        enable = true;
        package = inputs.yazi.packages.${pkgs.stdenv.hostPlatform.system}.default;
        shellWrapperName = "y";

        settings = {
          manager = {
            layout = [1 4 3];
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
  ];
}
