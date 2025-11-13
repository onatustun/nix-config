{
  flake.modules.homeManager.yazi = {inputs', ...}: {
    programs = {
      yazi = {
        enable = true;
        package = inputs'.yazi.packages.default;
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

      helix.settings.keys.normal.space = {
        e = [
          ":sh rm -f /tmp/unique-file-u41ae14"
          ":insert-output yazi '%{buffer_name}' --chooser-file=/tmp/unique-file-u41ae14"
          ":open %sh{try { cat /tmp/unique-file-u41ae14 } catch { '' }}"
          ":redraw"
        ];

        E = [
          ":sh rm -f /tmp/unique-file-h21a434"
          ":insert-output yazi '%{workspace_directory}' --chooser-file=/tmp/unique-file-h21a434"
          ":open %sh{try { cat /tmp/unique-file-h21a434 } catch { '' }}"
          ":redraw"
        ];
      };
    };
  };
}
