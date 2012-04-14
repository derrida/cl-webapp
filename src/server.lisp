;;; server.lisp

(in-package :dungeon-tool)

;;; utility functions to manage the web server.

(defun start-server ()
  (setf *web-server*
        (start
          (make-instance 'easy-acceptor
                         :port (port *site-config*)
                         :document-root (root *site-config*)))))

(defun stop-server ()
  (stop *web-server*))
