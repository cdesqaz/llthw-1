(defpackage #:my-new-package
  (:nicknames #:newpack)
  (:use :cl)
  (:export #:mad-adder))

(in-package :my-new-package)

;; Internal symbol is prepended with percent-sign and not exported with the
;; package api.
(defun %madder (x)
  (declare (integer x))
  (apply #'+ (loop for i from 1 upto x
		   collect (* x i))))

(defun mad-adder (x)
  "Call %MADDER with integer argument X."
  (%madder x))

(in-package :cl-user)

(newpack:mad-adder 10)
(newpack::%madder 10)
