;;; utils.lisp

(in-package :dungeon-tool)

;;; general utility helpers.

(defun get-path (&optional sub-path)
  "Return a full path relative to the project directory."
  (asdf:system-relative-pathname :dungeon-tool sub-path))
