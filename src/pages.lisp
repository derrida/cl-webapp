;;; page.lisp

(in-package :dungeon-tool)

;;; page initialization

;; define a page to be registered
(defmacro define-page ((name) &body body)
  `(progn
     (defun ,name ()
       ,@body)
     (push (create-regex-dispatcher
             ,(format nil "^/~(~a~)$" name)
             ',name) *dispatch-table*))) 

;;; page generators

;; a basic page containing the most basic html
(defmacro standard-page ((&key title) &body body)
  `(with-html-output-to-string (*standard-input* nil :prologue t :indent t)
     (:html :xmlns "http://www.w3.org/1999/xhtml" :xml\:lang "en" :lang "en"
      (:head
        (:meta :http-equiv "Content-Type" :content "text/html;charset=utf-8")
        (:title ,title)
        (:link :type "text/css" :rel "stylesheet" :href "/style.css"))
      (:body
        (:div :id "header"
         (:img :src "/logo.png" :alt "Logo" :class "logo"))
        ,@body))))
