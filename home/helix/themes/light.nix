{
  home.file.".config/helix/themes/light.toml" = {
    text = ''
      "attribute" = { fg = "violet" }
      "comment" = { fg = "base01" }
      "constant.builtin" = { fg = "cyan", modifiers = ["bold"] }
      "constant.character.escape" = { fg = "red", modifiers = ["bold"] }
      "constant" = { fg = "cyan" }
      "constructor" = { fg = "blue" }
      "diagnostic.deprecated" = { modifiers = ["crossed_out"] }
      "diagnostic.error" = { underline = { style = "curl", color = "red" } }
      "diagnostic.hint" = { underline = { style = "curl", color = "base01" } }
      "diagnostic.info" = { underline = { style = "curl", color = "blue" } }
      "diagnostic.unnecessary" = { modifiers = ["dim"] }
      "diagnostic.warning" = { underline = { style = "curl", color = "orange" } }
      "diff.delta" = { fg = "yellow" }
      "diff.minus" = { fg = "red" }
      "diff.plus" = { fg = "green" }
      "error" = { fg = "red", modifiers= ["bold", "underlined"] }
      "function.builtin" = { fg = "blue", modifiers = ["bold"] }
      "function" = { fg = "blue" }
      "function.macro" = { fg = "magenta" }
      "function.special" = { fg = "magenta" }
      "hint" = { fg = "base01", modifiers= ["bold", "underlined"] }
      "info" = { fg = "blue", modifiers= ["bold", "underlined"] }
      "keyword.directive" = { fg = "orange" }
      "keyword" = { fg = "green" }
      "label" = { fg = "green" }
      "markup.bold" = { fg = "yellow", modifiers = ["bold"] }
      "markup.heading" = "blue"
      "markup.italic" = { fg = "magenta", modifiers = ["italic"] }
      "markup.link.text" = "red"
      "markup.link.url" = { fg = "yellow", modifiers = ["underlined"] }
      "markup.list" = "red"
      "markup.quote" = "cyan"
      "markup.raw" = "green"
      "markup.strikethrough" = { modifiers = ["crossed_out"] }
      "module" = { fg = "violet" }
      "namespace" = { fg = "violet" }
      "operator" = { fg = "green" }
      "special" = { fg = "orange" }
      "string" = { fg = "cyan" }
      "tag" = { fg = "magenta" }
      "type.builtin" = { fg = "yellow", modifiers = ["bold"] }
      "type" = { fg = "yellow" }
      "ui.background" = {}
      "ui.cursor" = {fg = "base02", bg = "cyan"}
      "ui.cursor.insert" = {fg = "base03", bg = "base3"}
      "ui.cursorline" = { bg = "base0" }
      "ui.cursorline.primary" = { bg = "base02" }
      "ui.cursorline.secondary" = { bg = "base025" }
      "ui.cursor.match" = { fg = "base02", bg = "base015" }
      "ui.cursor.primary" = { fg = "base03", bg = "base1" }
      "ui.cursor.select" = { fg = "base02", bg = "cyan" }
      "ui.help" = { modifiers = ["reversed"] }
      "ui.linenr" = { fg = "base0", bg = "base02" }
      "ui.linenr.selected" = { fg = "blue", modifiers = ["bold"] }
      "ui.menu" = { fg = "base0", bg = "base02" }
      "ui.menu.selected" = { fg = "base02", bg = "base2"}
      "ui.popup" = { bg = "base02" }
      "ui.popup.info" = { bg = "base1" }
      "ui.selection" = { bg = "base0175" }
      "ui.selection.primary" = { bg = "base015" }
      "ui.statusline" = { fg = "base03", bg = "base0" }
      "ui.statusline.inactive" = { fg = "base1", bg = "base01" }
      "ui.statusline.insert" = { bg = "green" }
      "ui.statusline.normal" = { bg = "blue" }
      "ui.statusline.select" = { bg = "yellow" }
      "ui.text" = { fg = "base1" }
      "ui.text.focus" = { fg = "blue", modifiers = ["bold"]}
      "ui.text.info" = {fg = "base02", modifiers = ["bold"]}
      "ui.virtual.indent-guide" = { fg = "base02" }
      "ui.virtual.inlay-hint" = { fg = "base01", modifiers = ["italic"] }
      "ui.virtual.jump-label" = { fg = "red", modifiers = ["bold"] }
      "ui.virtual.ruler" = { bg = "base02" }
      "ui.virtual.whitespace" = { fg = "base01" }
      "ui.window" = { fg = "base3" }
      "variable.builtin" = { fg = "cyan", modifiers = ["bold"] }
      "variable.function" = { fg = "blue" }
      "warning" =  { fg = "orange", modifiers= ["bold", "underlined"] }

      [palette]
      red      = '#dc322f'
      green    = '#859900'
      yellow   = '#b58900'
      blue     = '#268bd2'
      magenta  = '#d33682'
      cyan     = '#2aa198'
      orange   = '#cb4b16'
      violet   = '#6c71c4'
      base0    = '#657b83'
      base1    = '#586e75'
      base2    = '#073642'
      base3    = '#002b36'
      base00   = '#839496'
      base01   = '#93a1a1'
      base015  = '#c5c8bd'
      base0175 = '#dddbcc'
      base02   = '#eee8d5'
      base025  = '#f5eedb'
      base03   = '#fdf6e3'
    '';
  };
}
