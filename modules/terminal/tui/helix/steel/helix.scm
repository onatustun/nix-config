(require "helix/editor.scm")
(require (prefix-in helix. "helix/commands.scm"))
(require (prefix-in helix.static. "helix/static.scm"))

(provide shell
         git-add
         open-helix-scm
         open-init-scm)

(define (current-path)
  (let* ([focus (editor-focus)]
         [focus-doc-id (editor->doc-id focus)])
    (editor-document->path focus-doc-id)))

(define (shell . args)
  (helix.run-shell-command (string-join (map (lambda (x)
                                               (if (equal? x "%")
                                                   (current-path)
                                                   x))
                                             args)
                                        " ")))
(define (git-add)
  (shell "git" "add" "%"))

(define (open-helix-scm)
  (helix.open (helix.static.get-helix-scm-path)))

(define (open-init-scm)
  (helix.open (helix.static.get-init-scm-path)))
