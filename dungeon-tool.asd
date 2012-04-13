;;; dungeon-tool.asd

(defsystem dungeon-tool
  :name "Dungeon Tool"
  :author "Michael Fiano <axedcode@gmail.com>"
  :description "Tool for Dungeon Masters to manage running a game of D&D"
  :depends-on (:hunchentoot :cl-who :parenscript :elephant)
  :components
    ((:module src
              :serial t
              :components
                ((:file "package")
                 (:file "database")
                 (:file "server")
                 (:file "pages")
                 (:module modules
                          :components
                            ((:file "characters")))
                 (:file "main")))))
