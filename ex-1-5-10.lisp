;;; Tress

(defun tree (val left right)
  (list val left right))

(defun tree-value (tree) (first tree))

(defun tree-left (tree) (second tree))

(defun tree-right (tree) (third tree))

(defun lookup (key tree)
  (if (null tree)
    nil
    (let ((k (car (tree-value tree))))
      (cond ((> k key) (lookup key (tree-left tree)))
            ((< k key) (lookup key (tree-right tree)))
            (t (tree-value tree))))))

(defun insert (key value tree)
  (if (null tree)
    (tree (cons key value) nil nil)
    (let ((k (car (tree-value tree))))
      (cond ((> k key)
             (tree (tree-value tree)
                   (insert key value (tree-left tree))
                   (tree-right tree)))
            ((< k key)
             (tree (tree-value tree)
                   (tree-left tree)
                   (insert key value (tree-right tree))))
            (t tree)))))

(defparameter *lst* '((5 . e)
                      (3 . c)
                      (4 . d)
                      (2 . b)
                      (1 . a)
                      (7 . g)
                      (6 . f)
                      (8 . h)
                      (9 . i)
                      (10 . j)))

(reduce
  (lambda (memo pair)
    (insert (car pair) (cdr pair) memo))
  *lst* :initial-value nil)

(defparameter *tree*
  (reduce
    (lambda (memo pair)
      (insert (car pair) (cdr pair) memo))
    *lst* :initial-value nil))

(defun rec-assoc (key alist)
  (cond ((null alist) nil)
        ((eq key (caar alist)) (car alist))
        (t (rec-assoc key (cdr alist)))))

;; trace is a very handy function that helps alot to understand recursive
;; function calls.
(trace lookup rec-assoc)

(rec-assoc 9 *lst*)
(lookup 9 *tree*)

(untrace lookup rec-assoc)
