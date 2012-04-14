;;; site.lisp

(in-package :dungeon-tool)

;; site configuration definition.

(defclass site-config ()
  ((port :accessor port
         :initarg :port
         :initform 8080)
   (root :accessor root
         :initarg :root
         :initform (get-path "site/static/"))
   (routes :accessor routes
           :initarg :routes)))

(defvar *site-config* (make-instance 'site-config))

(defun configure-site ()
  "Configure the site with the data from the site.conf file."
  (let ((config-data (with-open-file (stream (get-path "site/site.conf"))
                  (read stream))))
    (apply #'reinitialize-instance *site-config* config-data)
    (map-routes)))

(defun map-routes ()
  "Register the pages defined in the site configuration."
  (setq *dispatch-table* nil)
  (loop for (key value) on (routes *site-config*) by #'cddr do
        (push (create-regex-dispatcher value (intern (string key))) *dispatch-table*)))
