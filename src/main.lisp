;;; main.lisp

(in-package :dungeon-tool)

(define-page (characters) (page-character-list))
(define-page (characters/new) (page-character-new))
(define-page (characters/add) (page-character-add))

(defun main ()
  ;; open the database.
  (open-db)

  ;; start the web server.
  (start-server :port 8080))

  ;; map routes to pages
  (map-routes)
