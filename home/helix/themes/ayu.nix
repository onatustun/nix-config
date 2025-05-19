{
  home.file.".config/helix/themes/ayu.toml" = {
    text = ''
      "comment" = { fg = "gray", modifiers = ["italic"] }
      "constant" = "magenta"
      "constructor" = "green"
      "diagnostic.deprecated" = { modifiers = ["crossed_out"] }
      "diagnostic.error"= { underline = { color = "red", style = "curl" } }
      "diagnostic.hint"= { underline = { color = "blue", style = "curl" } }
      "diagnostic.info"= { underline = { color = "blue", style = "curl" } }
      "diagnostic.unnecessary" = { modifiers = ["dim"] }
      "diagnostic.warning"= { underline = { color = "yellow", style = "curl" } }
      "diff.delta" = "yellow"
      "diff.minus" = "red"
      "diff.plus" =  "green"
      "error" = { fg = "red", modifiers = ["bold"] }
      "function" = "yellow"
      "hint" = { fg = "blue", modifiers = ["bold"] }
      "info" = { fg = "blue", modifiers = ["bold"] }
      "keyword.control" = "yellow"
      "keyword.directive" = "yellow"
      "keyword" = "orange"
      "label" = "orange"
      "markup.bold" = { fg = "orange", modifiers = ["bold"] }
      "markup.heading" = "orange"
      "markup.italic" = { fg = "orange", modifiers = ["italic"] }
      "markup.link.label" = "green"
      "markup.link.text" = "yellow"
      "markup.link.url" = { fg = "blue", modifiers = ["underlined"] }
      "markup.list" = "yellow"
      "markup.quote" = "yellow"
      "markup.raw.block" = "orange"
      "markup.strikethrough" = { modifiers = ["crossed_out"] }
      "namespace" = "blue"
      "operator" = "orange"
      "punctuation" = "foreground"
      "special" = "orange"
      "string" = "green"
      "string.regexp" = "orange"
      "string.special" = "yellow"
      "tag" = "blue"
      "type" = "blue"
      "type.builtin" = "blue"
      "ui.background"= {}
      "ui.bufferline.active" = { fg = "foreground", bg = "dark_gray" }
      "ui.bufferline" = { fg = "gray", bg = "background" }
      "ui.cursor" = { fg = "dark_gray", bg = "yellow" }
      "ui.cursorline" = { bg = "black" }
      "ui.cursor.match" = "orange"
      "ui.cursor.primary" = { fg = "dark_gray", bg = "orange" }
      "ui.debug" = { fg = "orange", bg = "background" }
      "ui.help" = { fg = "#7B91b3", bg = "black" }
      "ui.highlight.frameline" = { bg = "#cfe0f2" }
      "ui.linenr" = "dark_gray"
      "ui.linenr.selected" = "gray"
      "ui.menu" = { fg = "foreground", bg = "black" }
      "ui.menu.selected" = { bg = "gray", fg = "background" }
      "ui.popup" = { fg = "#7B91b3", bg = "black" }
      "ui.selection" = { bg = "dark_gray" }
      "ui.statusline" = { fg = "foreground", bg = "black" }
      "ui.statusline.insert" = { fg = "black", bg = "orange" }
      "ui.statusline.normal" = { fg = "black", bg = "blue" }
      "ui.statusline.select" = { fg = "black", bg = "magenta" }
      "ui.text.focus" = { bg = "dark_gray", fg = "foreground" }
      "ui.text" = "foreground"
      "ui.text.info" = "foreground"
      "ui.virtual.inlay-hint" = { fg = "#f4a028", bg = "#fcf2e3" }  # bg original #ffaa3333
      "ui.virtual.jump-label" = { fg = "red", modifiers = ["italic", "bold"] }
      "ui.virtual.ruler" = { bg = "black" }
      "ui.virtual.whitespace" = "dark_gray"
      "ui.window" = "dark_gray"
      "variable" = "foreground"
      "warning" = "yellow"

      [palette]
      background = "#fafafa"
      foreground = "#5c6166"

      black = "#e7eaed"
      white = "#fcfcfc"
      blue = "#399ee6"
      light_blue = "#55b4d4"
      cyan = "#478acc"
      dark_gray = "#d8d8d7"
      gray = "#828c9a"
      green = "#86b300"
      magenta = "#a37acc"
      orange = "#fa8d3e"
      red = "#f07171"
      yellow = "#ffaa33"
    '';
  };
}
