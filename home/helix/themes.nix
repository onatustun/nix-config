{
  config,
  ...
}: {
  home.file.".config/helix/themes/stylix.toml" = {
    text = ''
      "attribute" = "${config.stylix.base16Scheme.base09}"
      "comment" = { fg = "${config.stylix.base16Scheme.base03}", modifiers = ["italic"] }
      "constant" = "${config.stylix.base16Scheme.base09}"
      "constant.character.escape" = "${config.stylix.base16Scheme.base0C}"
      "constant.numeric" = "${config.stylix.base16Scheme.base09}"
      "constructor" = "${config.stylix.base16Scheme.base0D}"
      "debug" = "${config.stylix.base16Scheme.base03}"
      "diagnostic" = { modifiers = ["underlined"] }
      "diff.delta" = "${config.stylix.base16Scheme.base09}"
      "diff.minus" = "${config.stylix.base16Scheme.base08}"
      "diff.plus" = "${config.stylix.base16Scheme.base0B}"
      "error" = "${config.stylix.base16Scheme.base08}"
      "function" = "${config.stylix.base16Scheme.base0D}"
      "hint" = "${config.stylix.base16Scheme.base03}"
      "info" = "${config.stylix.base16Scheme.base0D}"
      "keyword" = "${config.stylix.base16Scheme.base0E}"
      "label" = "${config.stylix.base16Scheme.base0E}"
      "namespace" = "${config.stylix.base16Scheme.base0E}"
      "operator" = "${config.stylix.base16Scheme.base05}"
      "special" = "${config.stylix.base16Scheme.base0D}"
      "string"  = "${config.stylix.base16Scheme.base0B}"
      "type" = "${config.stylix.base16Scheme.base0A}"
      "variable" = "${config.stylix.base16Scheme.base08}"
      "variable.other.member" = "${config.stylix.base16Scheme.base0B}"
      "warning" = "${config.stylix.base16Scheme.base09}"

      "markup.bold" = { fg = "${config.stylix.base16Scheme.base0A}", modifiers = ["bold"] }
      "markup.heading.1" = { fg = "${config.stylix.base16Scheme.base0D}", modifiers = ["bold"] }
      "markup.heading.2" = { fg = "${config.stylix.base16Scheme.base08}", modifiers = ["bold"] }
      "markup.heading.3" = { fg = "${config.stylix.base16Scheme.base09}", modifiers = ["bold"] }
      "markup.heading.4" = { fg = "${config.stylix.base16Scheme.base0A}", modifiers = ["bold"] }
      "markup.heading.5" = { fg = "${config.stylix.base16Scheme.base0B}", modifiers = ["bold"] }
      "markup.heading.6" = { fg = "${config.stylix.base16Scheme.base0C}", modifiers = ["bold"] }
      "markup.italic" = { fg = "${config.stylix.base16Scheme.base0E}", modifiers = ["italic"] }
      "markup.link.text" = "${config.stylix.base16Scheme.base08}"
      "markup.link.url" = { fg = "${config.stylix.base16Scheme.base09}", modifiers = ["underlined"] }
      "markup.list" = "${config.stylix.base16Scheme.base08}"
      "markup.quote" = "${config.stylix.base16Scheme.base0C}"
      "markup.raw" = "${config.stylix.base16Scheme.base0B}"
      "markup.strikethrough" = { modifiers = ["crossed_out"] }

      "diagnostic.hint" = { underline = { style = "curl" } }
      "diagnostic.info" = { underline = { style = "curl" } }
      "diagnostic.warning" = { underline = { style = "curl" } }
      "diagnostic.error" = { underline = { style = "curl" } }

      "ui.background" = { bg = "${config.stylix.base16Scheme.base00}" }
      "ui.bufferline.active" = { fg = "${config.stylix.base16Scheme.base00}", bg = "${config.stylix.base16Scheme.base03}", modifiers = ["bold"] }
      "ui.bufferline" = { fg = "${config.stylix.base16Scheme.base04}", bg = "${config.stylix.base16Scheme.base00}" }
      "ui.cursor" = { fg = "${config.stylix.base16Scheme.base05}", modifiers = ["reversed"] }
      "ui.cursor.insert" = { fg = "${config.stylix.base16Scheme.base05}", modifiers = ["reversed"] }
      "ui.cursorline.primary" = { fg = "${config.stylix.base16Scheme.base05}", bg = "${config.stylix.base16Scheme.base01}" }
      "ui.cursor.match" = { fg = "${config.stylix.base16Scheme.base05}", bg = "${config.stylix.base16Scheme.base02}", modifiers = ["bold"] }
      "ui.cursor.select" = { fg = "${config.stylix.base16Scheme.base05}", modifiers = ["reversed"] }
      "ui.gutter" = { bg = "${config.stylix.base16Scheme.base00}" }
      "ui.help" = { fg = "${config.stylix.base16Scheme.base06}", bg = "${config.stylix.base16Scheme.base01}" }
      "ui.linenr" = { fg = "${config.stylix.base16Scheme.base03}", bg = "${config.stylix.base16Scheme.base00}" }
      "ui.linenr.selected" = { fg = "${config.stylix.base16Scheme.base04}", bg = "${config.stylix.base16Scheme.base01}", modifiers = ["bold"] }
      "ui.menu" = { fg = "${config.stylix.base16Scheme.base05}", bg = "${config.stylix.base16Scheme.base01}" }
      "ui.menu.scroll" = { fg = "${config.stylix.base16Scheme.base03}", bg = "${config.stylix.base16Scheme.base01}" }
      "ui.menu.selected" = { fg = "${config.stylix.base16Scheme.base01}", bg = "${config.stylix.base16Scheme.base04}" }
      "ui.popup" = { bg = "${config.stylix.base16Scheme.base01}" }
      "ui.selection" = { bg = "${config.stylix.base16Scheme.base02}" }
      "ui.selection.primary" = { bg = "${config.stylix.base16Scheme.base02}" }
      "ui.statusline" = { fg = "${config.stylix.base16Scheme.base04}", bg = "${config.stylix.base16Scheme.base01}" }
      "ui.statusline.inactive" = { bg = "${config.stylix.base16Scheme.base01}", fg = "${config.stylix.base16Scheme.base03}" }
      "ui.statusline.insert" = { fg = "${config.stylix.base16Scheme.base00}", bg = "${config.stylix.base16Scheme.base0B}" }
      "ui.statusline.normal" = { fg = "${config.stylix.base16Scheme.base00}", bg = "${config.stylix.base16Scheme.base03}" }
      "ui.statusline.select" = { fg = "${config.stylix.base16Scheme.base00}", bg = "${config.stylix.base16Scheme.base0F}" }
      "ui.text" = "${config.stylix.base16Scheme.base05}"
      "ui.text.directory" = "${config.stylix.base16Scheme.base0D}"
      "ui.text.focus" = "${config.stylix.base16Scheme.base05}"
      "ui.virtual.indent-guide" = { fg = "${config.stylix.base16Scheme.base03}" }
      "ui.virtual.inlay-hint" = { fg = "${config.stylix.base16Scheme.base03}" }
      "ui.virtual.ruler" = { bg = "${config.stylix.base16Scheme.base01}" }
      "ui.virtual.jump-label" = { fg = "${config.stylix.base16Scheme.base0A}", modifiers = ["bold"] }
      "ui.window" = { bg = "${config.stylix.base16Scheme.base01}" }
    '';
  };
}
