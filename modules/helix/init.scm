(require "helix/configuration.scm")
(require "helix/keymaps.scm")
(require "oil/oil.scm")

(keymap (global)
  (normal
    (space
      (o
        (o ":oil")
        (e ":oil-enter")
        (u ":oil-up")
        (s ":oil-save")
        (r ":oil-refresh")
        (q ":oil-close")))))

