(require "helix/configuration.scm")
(require "smooth-scroll/smooth-scroll.scm")

(define-language "scheme"
                 (formatter (command "raco") (args '("fmt" "-i")))
                 (auto-format #true)
                 (language-servers '("steel-language-server")))

(true-color #t)
(middle-click-paste #f)
(cursorline #t)
(continue-comments #f)
(auto-format #f)
(completion-replace #t)
(color-modes #t)
(insert-final-newline #f)
(file-picker (fp-hidden #f))
(auto-pairs #t)
