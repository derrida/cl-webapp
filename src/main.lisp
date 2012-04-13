;;; main.lisp

(in-package :dungeon-tool)

(defun main ()
  ;; open the database.
  (open-db)

  ;; start the web server.
  (start-server :port 8080))

  ;; map routes to pages
  (map-routes)
