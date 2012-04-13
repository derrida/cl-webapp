;;; database.lisp

(in-package :dungeon-tool)

(defun open-db (&key (file))
  (setf *database* (open-store '(:clsql (:sqlite3 :file)))))
