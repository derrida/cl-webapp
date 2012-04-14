;;; dungeon-tool.asd

(defsystem dungeon-tool
  :name "Dungeon Tool"
  :author "Michael Fiano <axedcode@gmail.com>"
  :description "Tool for Dungeon Masters to manage running a game of D&D"
  :depends-on (:hunchentoot :elephant :cl-who :css-lite :parenscript)
  :components
    ((:module src
              :serial t
              :components
                ((:file "package")
                 (:file "utils")
                 (:file "site")
                 (:file "database")
                 (:file "server")
                 (:file "documents")
                 (:module modules
                          :components
                            ((:file "characters")))
                 (:file "main")))))
