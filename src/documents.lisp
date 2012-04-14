;;; documents.lisp

(in-package :dungeon-tool)

(defmacro page-site ((&key title) &body body)
  "The basic template for all site pages."
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

(defun style-site ()
  (setf (content-type* *reply*) "text/css")
  (css-lite:css
    (("body")
     (:width "70%"
      :margin "0 auto"
      :font-family "sans-seri"))
    (("#header")
     (:background-color "#437ea7"
      :padding "8px"))))
 
