;;; server.lisp

(in-package :dungeon-tool)

;;; utility functions to manage the web server.

(defun start-server (&optional &key (port 8080))
  (setf *web-server*
        (start
          (make-instance 'easy-acceptor
                         :port port
                         :document-root (asdf:system-relative-pathname
                                          :dungeon-tool "site/static/")))))

(defun stop-server ()
  (stop *web-server*))
