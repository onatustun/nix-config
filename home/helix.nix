{
  config,
  ...
}: {
  programs.helix.enable = true;

  home.file.".config/helix/config.toml" = {
    text = ''
      theme = "stylix"

      [editor]
      auto-pairs = true
      color-modes = true
      cursor-line = true
      line-number = "relative"
      mouse = true

      [editor.lsp]
      display-inlay-hints = true
      display-messages = true
    '';
  };
  
  home.file.".config/helix/themes/stylix.toml" = {
    text = ''
      "attribute" = "base09"
      "comment" = { fg = "base03", modifiers = ["italic"] }
      "constant" = "base09"
      "constant.character.escape" = "base0C"
      "constant.numeric" = "base09"
      "constructor" = "base0D"
      "debug" = "base03"
      "diagnostic" = { modifiers = ["underlined"] }
      "diff.delta" = "base09"
      "diff.minus" = "base08"
      "diff.plus" = "base0B"
      "error" = "base08"
      "function" = "base0D"
      "hint" = "base03"
      "info" = "base0D"
      "keyword" = "base0E"
      "label" = "base0E"
      "namespace" = "base0E"
      "operator" = "base05"
      "special" = "base0D"
      "string"  = "base0B"
      "type" = "base0A"
      "variable" = "base08"
      "variable.other.member" = "base0B"
      "warning" = "base09"

      "markup.bold" = { fg = "base0A", modifiers = ["bold"] }
      "markup.heading.1" = { fg = "base0D", modifiers = ["bold"] }
      "markup.heading.2" = { fg = "base08", modifiers = ["bold"] }
      "markup.heading.3" = { fg = "base09", modifiers = ["bold"] }
      "markup.heading.4" = { fg = "base0A", modifiers = ["bold"] }
      "markup.heading.5" = { fg = "base0B", modifiers = ["bold"] }
      "markup.heading.6" = { fg = "base0C", modifiers = ["bold"] }
      "markup.italic" = { fg = "base0E", modifiers = ["italic"] }
      "markup.link.text" = "base08"
      "markup.link.url" = { fg = "base09", modifiers = ["underlined"] }
      "markup.list" = "base08"
      "markup.quote" = "base0C"
      "markup.raw" = "base0B"
      "markup.strikethrough" = { modifiers = ["crossed_out"] }

      "diagnostic.hint" = { underline = { style = "curl" } }
      "diagnostic.info" = { underline = { style = "curl" } }
      "diagnostic.warning" = { underline = { style = "curl" } }
      "diagnostic.error" = { underline = { style = "curl" } }

      "ui.background" = { bg = "base00" }
      "ui.bufferline.active" = { fg = "base00", bg = "base03", modifiers = ["bold"] }
      "ui.bufferline" = { fg = "base04", bg = "base00" }
      "ui.cursor" = { fg = "base05", modifiers = ["reversed"] }
      "ui.cursor.insert" = { fg = "base05", modifiers = ["reversed"] }
      "ui.cursorline.primary" = { fg = "base05", bg = "base01" }
      "ui.cursor.match" = { fg = "base05", bg = "base02", modifiers = ["bold"] }
      "ui.cursor.select" = { fg = "base05", modifiers = ["reversed"] }
      "ui.gutter" = { bg = "base00" }
      "ui.help" = { fg = "base06", bg = "base01" }
      "ui.linenr" = { fg = "base03", bg = "base00" }
      "ui.linenr.selected" = { fg = "base04", bg = "base01", modifiers = ["bold"] }
      "ui.menu" = { fg = "base05", bg = "base01" }
      "ui.menu.scroll" = { fg = "base03", bg = "base01" }
      "ui.menu.selected" = { fg = "base01", bg = "base04" }
      "ui.popup" = { bg = "base01" }
      "ui.selection" = { bg = "base02" }
      "ui.selection.primary" = { bg = "base02" }
      "ui.statusline" = { fg = "base04", bg = "base01" }
      "ui.statusline.inactive" = { bg = "base01", fg = "base03" }
      "ui.statusline.insert" = { fg = "base00", bg = "base0B" }
      "ui.statusline.normal" = { fg = "base00", bg = "base03" }
      "ui.statusline.select" = { fg = "base00", bg = "base0F" }
      "ui.text" = "base05"
      "ui.text.directory" = "base0D"
      "ui.text.focus" = "base05"
      "ui.virtual.indent-guide" = { fg = "base03" }
      "ui.virtual.inlay-hint" = { fg = "base03" }
      "ui.virtual.ruler" = { bg = "base01" }
      "ui.virtual.jump-label" = { fg = "base0A", modifiers = ["bold"] }
      "ui.window" = { bg = "base01" }

      [palette]
      base00 = "${config.stylix.base16Scheme.base00}"
      base01 = "${config.stylix.base16Scheme.base01}"
      base02 = "${config.stylix.base16Scheme.base02}"
      base03 = "${config.stylix.base16Scheme.base03}"
      base04 = "${config.stylix.base16Scheme.base04}"
      base05 = "${config.stylix.base16Scheme.base05}"
      base06 = "${config.stylix.base16Scheme.base06}"
      base07 = "${config.stylix.base16Scheme.base07}"
      base08 = "${config.stylix.base16Scheme.base08}"
      base09 = "${config.stylix.base16Scheme.base09}"
      base0A = "${config.stylix.base16Scheme.base0A}"
      base0B = "${config.stylix.base16Scheme.base0B}"
      base0C = "${config.stylix.base16Scheme.base0C}"
      base0D = "${config.stylix.base16Scheme.base0D}"
      base0E = "${config.stylix.base16Scheme.base0E}"
      base0F = "${config.stylix.base16Scheme.base0F}"
    '';
  };
}
