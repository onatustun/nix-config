{
  imports = [
    ./themes.nix
  ];

  programs.helix = {
    enable = true;
    defaultEditor = true;
              
    settings = {
      theme = "stylix";

      editor = {
        auto-completion = false;
        auto-format = true;
        auto-info = true;
        auto-pairs = true;
        auto-save = false;
        bufferline = "multiple";
        color-modes = true;
        completion-replace = true;
        completion-trigger-len = 2;
        cursorcolumn = false;
        cursorline = true;
        idle-timeout = 0;
        line-number = "relative";
        middle-click-paste = true;
        mouse = true;
        scroll-lines = 3;
        scrolloff = 5;
        text-width = 100;
        true-color = false;
        undercurl = false;

        shell = [
          "bash"
          "-c"
        ];

        lsp = {
          auto-signature-help = true;
          display-inlay-hints = true;
          display-messages = true;
          display-signature-help-docs = true;
          enable = true;
          goto-reference-include-declaration = true;
          snippets = true;
        };

        statusline = {
          left = [
            "mode"
            "spinner"
            "file-name"
            "read-only-indicator"
            "file-modification-indicator"
          ];

          right = [
            "version-control"
            "diagnostics"
            "selections"
            "position"
            "total-line-numbers"
          ];

          mode = {
            normal = "NORMAL";
            insert = "INSERT";
            select = "SELECT";
          };
        };

        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "block";
        };

        file-picker = {
          deduplicate-links = true;
          follow-symlinks = true;
          git-exclude = true;
          git-global = true;
          git-ignore = true;
          hidden = false;
          ignore = true;
          parents = true;
        };

        search = {
          smart-case = true;
          wrap-around = true;
        };

        whitespace = {
          characters.tab = "→";
          render.tab = "all";
        };

        indent-guides = {
          character = "▏";
          render = true;
          skip-levels = 1;
        };

        gutters = {
          layout = [
            "diagnostics"
            "spacer"
            "line-numbers"
            "spacer"
            "diff"
          ];
        
          line-numbers.min-width = 3;
        };

        soft-wrap = {
          enable = false;
          max-indent-retain = 40;
          max-wrap = 20;
          wrap-at-text-width = false;
          wrap-indicator = "↪";
        };
      };
    };
  };
}
