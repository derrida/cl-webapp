;;; page.lisp

(in-package :dungeon-tool)

(defmacro standard-page ((&key title) &body body)
  "The standard web page generator for all pages."
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
