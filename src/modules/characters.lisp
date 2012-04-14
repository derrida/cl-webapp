;;; characters.lisp

(in-package :dungeon-tool)

;;; web page definitions

(defun page-character-list ()
  "Page listing every character."
  (page-site
    (:title "Character List")
    (:h1 "Characters")
    (:p
      (:a :href "/characters/new" "New Character"))
    (dolist (c (character-list))
      (htm
        (:li
          (fmt "~A (Level ~d)" (name c) (level c)))))))

(defun page-character-new ()
  "Page for creating a new character."
  (page-site
    (:title "New Character")
    (:h1 "Create a new character")
    (:form :action "/characters/add" :method "post"
     (:p "Name:"
      (:input :type "text" :name "name" :class "textbox"))
     (:p
       (:input :type "submit" :value "Add" :class "button")))))

(defun page-character-add ()
  "Page for adding a newly created character to the database."
  (let ((name (parameter "name")))
    (unless (or (null name) (zerop (length name)))
      (add-character name))
    (redirect "/characters")))

;;; character object definition

(defpclass game-character ()
  ((name :reader name
         :initarg :name
         :index t)
   (level :accessor level
          :initform 1
          :index t)))

(defmethod level-up (character)
  incf (level character))

;;; character utility functions

(defun character-from-name (name)
  "Return a character from the given name."
  (get-instances-by-value 'game-character 'name name))

(defun character-exists? (name)
  "Check if a character by the given name exists in the database."
  (character-from-name name))

(defun add-character (name)
  "Create a character with the given name and add it to the database."
  (with-transaction ()
    (unless (character-exists? name)
      (make-instance 'game-character :name name))))

(defun character-list ()
  "List all characters."
  (get-instances-by-range 'game-character 'name nil nil))
