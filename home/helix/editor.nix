{
  default-yank-register = "+";
  middle-click-paste = false;

  shell = [
    "bash"
    "-c"
  ];

  line-number = "relative";
  cursorline = true;
  continue-comments = false;
  auto-format = false;
  idle-timeout = 0;
  completion-replace = true;
  bufferline = "multiple";
  color-modes = true;
  insert-final-newline = false;
  end-of-line-diagnostics = "warning";
  clipboard-provider = "wayland";
  lsp.display-inlay-hints = true;
  cursor-shape.insert = "bar";
  file-picker.hidden = false;
  auto-pairs = true;
  auto-save = false;
  inline-diagnostics.cursor-line = "warning";

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
      normal = "N";
      insert = "I";
      select = "S";
    };
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

    line-numbers.min-width = 1;
  };
}
