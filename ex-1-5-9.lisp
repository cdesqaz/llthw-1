;;; Tress

(defvar *tree* '((2 .b ) ((1 . a) nil nil) ((3 . c) nil ((4 . d) nil nil))))

(defun lookup (key sorted-tree)
  (let ((k (caar sorted-tree)))
    (cond ((null sorted-tree) nil)
          ((> k key)
           (lookup key (second sorted-tree)))
          ((< k key)
           (lookup key (third sorted-tree)))
          (t
           (first sorted-tree)))))
