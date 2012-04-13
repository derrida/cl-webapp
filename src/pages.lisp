;;; page.lisp

(in-package :dungeon-tool)

;;; page initialization

(defun map-routes ()
  (setq *dispatch-table*
        (list
          (create-regex-dispatcher "^/characters$" 'page-character-list)
          (create-regex-dispatcher "^/characters/new$" 'page-character-new)
          (create-regex-dispatcher "^/characters/add" 'page-character-add))))

;;; page generators

;; a basic page containing the most basic html
(defmacro standard-page ((&key title) &body body)
  `(with-html-output-to-string (*standard-input* nil :prologue t :indent t)
     (:html :xmlns "http://www.w3.org/1999/xhtml" :xml\:lang "en" :lang "en"
      (:head
        (:meta :http-equiv "Content-Type" :content "text/html;charset=utf-8")
        (:title ,title)
        (:link :type "text/css" :rel "stylesheet" :href "/css/site.css"))
      (:body
        (:div :id "header"
         (:img :src "/images/logo.png" :alt "Logo" :class "logo"))
        ,@body))))
