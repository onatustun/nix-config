{
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [
    ./themes
  ];

  programs.helix = {
    enable = true;
    defaultEditor = true;

    extraPackages = with pkgs; [
      markdown-oxide
    ];

    languages = import ./languages.nix { inherit
      pkgs
      lib
      inputs;
    };
              
    settings = {
      theme = "solarized-osaka";

      editor = {
        mouse = true;
        scrolloff = 5;
        default-yank-register = "+";
        middle-click-paste = false;
        scroll-lines = 3;

        shell = [
          "bash"
          "-c"
        ];
      
        line-number = "relative";
        cursorline = true;
        cursorcolumn = false;
        continue-comments = true;
        auto-completion = true;
        path-completion = true;
        auto-format = false;
        idle-timeout = 0;
        completion-timeout = 250;
        preview-completion-insert = true;
        completion-trigger-len = 2;
        completion-replace = true;       
        auto-info = true;
        true-color = false;
        undercurl = false;
        bufferline = "multiple";
        color-modes = true;
        text-width = 80;
        workspace-lsp-roots = [];
        end-of-line-diagnostics = "warning";
        clipboard-provider = "wayland";

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

        lsp = {
          enable = true;
          display-messages = true;
          display-progress-messages = false;
          auto-signature-help = true;
          display-inlay-hints = true;
          display-signature-help-docs = true;
          snippets = true;
          goto-reference-include-declaration = true;
        };

        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "block";
        };

        file-picker = {
          hidden = false;
          follow-symlinks = true;
          deduplicate-links = true;
          parents = true;
          ignore = true;
          git-ignore = true;
          git-global = true;
          git-exclude = true;
        };

        auto-pairs = true;
        auto-save = false;

        search = {
          smart-case = true;
          wrap-around = true;
        };

        whitespace = {
          render.tab = "all";
          characters.tab = "→";
        };

        indent-guides = {
          render = true;
          character = "▏";
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
          max-wrap = 20;
          max-indent-retain = 40;
          wrap-indicator = "↪";
          wrap-at-text-width = false;
        };

        smart-tab = {
          enable = true;
          supersede-menu = false;
        };

        inline-diagnostics = {
          cursor-line = "warning";
          other-lines = "disable";
          prefix-len = 1;
          max-wrap = 20;
          max-diagnostics = 10;
        };
      };
    };
  };
}
