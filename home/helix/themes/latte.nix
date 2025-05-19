{
  home.file.".config/helix/themes/latte.toml" = {
    text = ''
      "attribute" = "yellow"
      "comment" = { fg = "overlay2", modifiers = ["italic"] }
      "constant.character.escape" = "pink"
      "constant.character" = "teal"
      "constant" = "peach"
      "constructor" = "sapphire"
      "diagnostic.error" = { underline = { color = "red", style = "curl" } }
      "diagnostic.hint" = { underline = { color = "teal", style = "curl" } }
      "diagnostic.info" = { underline = { color = "sky", style = "curl" } }
      "diagnostic.unnecessary" = { modifiers = ["dim"] }
      "diagnostic.warning" = { underline = { color = "yellow", style = "curl" } }
      "diff.delta" = "blue"
      "diff.minus" = "red"
      "diff.plus" = "green"
      "function" = "blue"
      "function.macro" = "mauve"
      "keyword.control.conditional" = { fg = "mauve", modifiers = ["italic"] }
      "keyword" = "mauve"
      "label" = "sapphire" # used for lifetimes
      "markup.bold" = { fg = "red", modifiers = ["bold"] }
      "markup.heading.1" = "red"
      "markup.heading.2" = "peach"
      "markup.heading.3" = "yellow"
      "markup.heading.4" = "green"
      "markup.heading.5" = "sapphire"
      "markup.heading.6" = "lavender"
      "markup.italic" = { fg = "red", modifiers = ["italic"] }
      "markup.link.label" = "sapphire"
      "markup.link.text" = "lavender"
      "markup.link.url" = { fg = "blue", modifiers = ["italic", "underlined"] }
      "markup.list.checked" = "green"
      "markup.list" = "teal"
      "markup.list.unchecked" = "overlay2"
      "markup.quote" = "pink"
      "markup.raw" = "green"
      "namespace" = { fg = "yellow", modifiers = ["italic"] }
      "operator" = "sky"
      "punctuation" = "overlay2"
      "punctuation.special" = "sky"
      "special" = "blue" # fuzzy highlight
      "string" = "green"
      "string.regexp" = "pink"
      "string.special" = "blue"
      "string.special.symbol" = "red"
      "tag" = "blue"
      "type.enum.variant" = "teal"
      "type" = "yellow"
      "ui.background" = { fg = "text" }
      "ui.bufferline.active" = { fg = "mauve", bg = "base", underline = { color = "mauve", style = "line" } }
      "ui.bufferline.background" = { bg = "crust" }
      "ui.bufferline" = { fg = "subtext0", bg = "mantle" }
      "ui.cursor" = { fg = "base", bg = "secondary_cursor" }
      "ui.cursor.insert" = { fg = "base", bg = "secondary_cursor_insert" }
      "ui.cursorline.primary" = { bg = "cursorline" }
      "ui.cursor.match" = { fg = "peach", modifiers = ["bold"] }
      "ui.cursor.normal" = { fg = "base", bg = "secondary_cursor_normal" }
      "ui.cursor.primary" = { fg = "base", bg = "rosewater" }
      "ui.cursor.primary.insert" = { fg = "base", bg = "green" }
      "ui.cursor.primary.normal" = { fg = "base", bg = "rosewater" }
      "ui.cursor.primary.select" = { fg = "base", bg = "lavender" }
      "ui.cursor.select" = { fg = "base", bg = "secondary_cursor_select" }
      "ui.help" = { fg = "overlay2", bg = "surface0" }
      "ui.highlight" = { bg = "surface1", modifiers = ["bold"] }
      "ui.linenr" = { fg = "surface1" }
      "ui.linenr.selected" = { fg = "lavender" }
      "ui.menu" = { fg = "overlay2", bg = "surface0" }
      "ui.menu.selected" = { fg = "text", bg = "surface1", modifiers = ["bold"] }
      "ui.popup" = { fg = "text", bg = "surface0" }
      "ui.selection" = { bg = "surface1" }
      "ui.statusline" = { fg = "subtext1", bg = "mantle" }
      "ui.statusline.inactive" = { fg = "surface2", bg = "mantle" }
      "ui.statusline.insert" = { fg = "base", bg = "green", modifiers = ["bold"] }
      "ui.statusline.normal" = { fg = "base", bg = "rosewater", modifiers = ["bold"] }
      "ui.statusline.select" = { fg = "base", bg = "lavender", modifiers = ["bold"] }
      "ui.text.directory" = { fg = "blue" }
      "ui.text.focus" = { fg = "text", bg = "surface0", modifiers = ["bold"] }
      "ui.text.inactive" = { fg = "overlay1" }
      "ui.text" = "text"
      "ui.virtual.indent-guide" = "surface0"
      "ui.virtual.inlay-hint" = { fg = "surface1", bg = "mantle" }
      "ui.virtual.jump-label" = { fg = "rosewater", modifiers = ["bold"] }
      "ui.virtual" = "overlay0"
      "ui.virtual.ruler" = { bg = "surface0" }
      "ui.window" = { fg = "crust" }
      "variable.builtin" = "red"
      "variable.other.member" = "blue"
      "variable.parameter" = { fg = "maroon", modifiers = ["italic"] }
      "variable" = "text"

      error = "red"
      warning = "yellow"
      info = "sky"
      hint = "teal"

      [palette]
      rosewater = "#dc8a78"
      flamingo = "#dd7878"
      pink = "#ea76cb"
      mauve = "#8839ef"
      red = "#d20f39"
      maroon = "#e64553"
      peach = "#fe640b"
      yellow = "#df8e1d"
      green = "#40a02b"
      teal = "#179299"
      sky = "#04a5e5"
      sapphire = "#209fb5"
      blue = "#1e66f5"
      lavender = "#7287fd"
      text = "#4c4f69"
      subtext1 = "#5c5f77"
      subtext0 = "#6c6f85"
      overlay2 = "#7c7f93"
      overlay1 = "#8c8fa1"
      overlay0 = "#9ca0b0"
      surface2 = "#acb0be"
      surface1 = "#bcc0cc"
      surface0 = "#ccd0da"
      base = "#eff1f5"
      mantle = "#e6e9ef"
      crust = "#dce0e8"

      cursorline = "#e8ecf1"
      secondary_cursor = "#e1a99d"
      secondary_cursor_normal = "#97a7fb"
      secondary_cursor_insert = "#74b867"
    '';
  };
}
