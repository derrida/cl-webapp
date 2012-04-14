;;; site.lisp

(in-package :dungeon-tool)

;; site configuration definition.

(defclass site-config ()
  ((port :accessor port
         :initarg :port
         :initform 8080)
   (root :accessor root
         :initarg :root
         :initform "/")
   (routes :accessor routes
           :initarg :routes)))

(defvar *site-config* (make-instance 'site-config))

(defun configure-site ()
  "Configure the site with the data from the site.conf file."
  (let ((config-data (with-open-file (stream (get-path "site/site.conf"))
                  (read stream))))
    (apply #'reinitialize-instance *site-config* config-data)))

(defun map-routes ()
  (setq *dispatch-table*
        (list
          (create-regex-dispatcher "^/css/site.css" 'page-css)
          (create-regex-dispatcher "^/characters$" 'page-character-list)
          (create-regex-dispatcher "^/characters/new$" 'page-character-new)
          (create-regex-dispatcher "^/characters/add$" 'page-character-add))))
