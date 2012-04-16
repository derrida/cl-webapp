;;; site.lisp

(in-package :dungeon-tool)

;; site configuration definition.

(defclass site-config ()
  ((port :accessor port
         :initarg :port
         :initform 8080)
   (root :reader root
         :initarg :root
         :initform (get-path "site/static/"))
   (modules :accessor modules
            :initarg :modules)
   (routes :accessor routes
           :initarg :routes)))

(defvar *site-config* (make-instance 'site-config))
(defvar *site-modules* '())

(defun configure-site ()
  "Configure the site with the data from the site.conf file."
  (let ((config-data (with-open-file (stream (get-path "site/site.conf"))
                  (read stream))))
    (apply #'reinitialize-instance *site-config* config-data)
    (clear-routes)
    (register-modules (modules *site-config*))
    (map-routes (routes *site-config*))))

(defun map-routes (routes &optional &key (mount ""))
  "Register the pages defined in the site configuration."
  (loop for (key value) on routes by #'cddr do
        (let ((key (intern (string key)))
              (value (format nil "^~(~a~a~)/?$" mount value)))
          (push (create-regex-dispatcher value key) *dispatch-table*))))

(defun clear-routes ()
  "Clear the exposed routes."
  (setf *dispatch-table* nil))
 
(defun remap-routes ()
  "Clear and re-map the exposed routes."
  (clear-routes)
  (map-routes (routes *site-config*)))

(defun find-module (name)
  (find name *site-modules* :test #'string-equal :key #'name))

(defun register-modules (module-config)
  "Register the modules defined in the site configuration."
  (loop for (module mount) on module-config by #'cddr do
        (let ((module (make-instance module :mount mount)))
          (push module *site-modules*)
          (map-routes (routes module) :mount mount))))
