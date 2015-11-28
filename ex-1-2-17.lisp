(with-open-file (b "/tmp/binary-monkey.txt"
                   :direction :output
                   :element-type 'unsigned-byte
                   :if-exists :supersede)
  (write-byte 109 b)
  (write-byte 111 b)
  (write-byte 110 b)
  (write-byte 107 b)
  (write-byte 101 b)
  (write-byte 121 b))

(defvar *monkey* '(109 111 110 107 101 121))

(with-open-file (b "/tmp/binary-monkey.txt"
                   :direction :output
                   :element-type 'unsigned-byte
                   :if-exists :supersede)
  (do* ((i 0 (+ i 1)) (c (nth i *monkey*) (nth i *monkey*))) 
       ((>= i (length *monkey*)) "done")
    (write-byte c b)))

(with-open-file (s "/tmp/binary-monkey.txt"
                   :direction :input)
  (format t "" (read-line s)))
