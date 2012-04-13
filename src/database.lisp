;;; database.lisp

(in-package :dungeon-tool)

(setf *store* (open-store '(:clsql (:sqlite3 "/tmp/dungeon-tool.db"))))
