;;; database.lisp

(in-package :dungeon-tool)

(defun open-db ()
  (setf *store* (open-store '(:clsql (:sqlite3 "/tmp/dungeon-tool.db")))))
