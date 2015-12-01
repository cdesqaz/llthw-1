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


(with-open-file (b "/tmp/binary-monkey.txt"
                   :direction :output
                   :element-type 'unsigned-byte
                   :if-exists :supersede)
  (let ((monkey '(#x6d #x6f #x6e #x6b #x65 #x79)))
    (do* ((i 0 (+ i 1)) (c (first monkey) (nth i monkey))) 
       ((>= i (length monkey)) "done")
    (write-byte c b))))

(with-open-file (b "/tmp/binary-monkey.txt"
                   :direction :output
                   :element-type 'unsigned-byte
                   :if-exists :supersede)
  (let ((monkey '(#o155 #o157 #o156 #o153 #o145 #o171)))
    (do* ((i 0 (+ i 1)) (c (first monkey) (nth i monkey))) 
       ((>= i (length monkey)) "done")
    (write-byte c b))))

;;; For case conversion in format: http://www.lispworks.com/documentation/HyperSpec/Body/22_cha.htm
(with-open-file (s "/tmp/binary-monkey.txt"
                   :direction :input)
  (format t "~:@(~A~)~%" (read-line s)))
