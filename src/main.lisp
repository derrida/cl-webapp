;;; main.lisp

(in-package :dungeon-tool)

(define-page (characters) (page-character-list))
(define-page (characters/new) (page-character-new))
(define-page (characters/add) (page-character-add))

(defun main ()
  ;; start the web server.
  (start-server :port 8080))
