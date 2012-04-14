;;; main.lisp

(in-package :dungeon-tool)

(defun main ()
  ;; read the site-wide configuration.
  (configure-site)

  ;; open the database.
  (open-db)

  ;; start the web server.
  (start-server))
