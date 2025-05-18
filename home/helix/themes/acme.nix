{
  home.file.".config/helix/themes/acme.toml" = {
    text = ''
      "comment" = "green"
      "diagnostic.deprecated" = { modifiers = ["crossed_out"] }
      "diagnostic.error" = {bg="red", fg="white", modifiers=["bold"]}
      "diagnostic.hint" = {fg="gray", modifiers=["bold"]}
      "diagnostic.unnecessary" = { modifiers = ["dim"] }
      "diagnostic.warning" = {bg="orange", fg="black", modifiers=["bold"]}
      "diff.delta" = {fg = "acme_bar_bg"}
      "diff.minus" = {fg = "red"}
      "diff.plus" = {fg = "green"}
      "string" = "red"
      "ui.background" = {bg="acme_bg"}
      "ui.bufferline.active" = { fg = "black", bg = "acme_bg" }
      "ui.bufferline" = { fg = "black", bg = "acme_bar_bg" }
      "ui.cursor" = {bg="cursor", fg="white"}
      "ui.cursorline" = {bg="acme_bar_bg"}
      "ui.cursor.match" = {bg="acme_bar_bg"}
      "ui.debug" = {fg="orange"}
      "ui.help" = {fg="black", bg="acme_bg"}
      "ui.highlight.frameline" = {bg="#da8581"}
      "ui.linenr" = {bg="acme_bg", fg="black"}
      "ui.linenr.selected" = {bg="acme_bg", fg="black"}
      "ui.menu" = {fg="black", bg="acme_bg"}
      "ui.menu.selected" = {bg="selected"}
      "ui.popup" = {fg="black", bg="acme_bg"}
      "ui.selection" = {bg="selected"}
      "ui.statusline" = {fg="black", bg="acme_bar_bg"}
      "ui.statusline.inactive" = {fg="black", bg="acme_bar_inactive"}
      "ui.text" = "black"
      "ui.virtual" = "indent"
      "ui.virtual.ruler" = { bg = "acme_bar_bg" }
      "ui.window" = {bg="acme_bg"}

      [palette]
      white = "#ffffff"
      acme_bg = "#ffffea"
      black = "#000000"
      selected = "#eeee9e"
      acme_bar_bg = "#aeeeee"
      acme_bar_inactive = "#eaffff"
      cursor = "#444444"
      red = "#a0342f"
      green = "#065905"
      indent = "#aaaaaa"
      orange = "#f0ad4e"
      gray = "#777777"
    '';
  };
}
