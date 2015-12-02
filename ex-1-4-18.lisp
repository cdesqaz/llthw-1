;;;; Circular Trees

(defparameter *knot* (list 1 2 3 4 (cons nil nil)))

(defun cycle-walk (count cycle &key (turn #'car))
  (loop with place = cycle
        repeat count for elem = (car place)
        unless (consp elem) do (format t "~a " elem)
        do (setf place (if (consp elem)
                         (funcall turn elem)
                         (cdr place)))))

(setf (car (nth 4 *knot*)) (cdr *knot*))
(setf (cdr (nth 4 *knot*)) (cddr *knot*))
(cycle-walk 25 *knot* :turn #'car)
(cycle-walk 25 *knot* :turn #'cdr)

(let ((dir))
  (defun switch (pair)
    (setf dir (not dir))
    (if dir
      (car pair)
      (cdr pair))))
