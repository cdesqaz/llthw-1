(with-open-file (s "/tmp/monkey.txt"
                   :direction :output
                   :if-does-not-exist :create
                   :if-exists :supersede)
  (format s
          "I had a little monkey, ~%Brought him to the country, ~%Fed him on ginger-bread...~%"))

(with-open-file (s "/tmp/monkey.txt" :direction :input)
  (format t "~&;;; ~A" (read-line s)))

(with-open-file (s "/tmp/monkey.txt" :direction :input)
  (do ((line (read-line s) (read-line s nil 'eof)))
      ((eq line 'eof) "-- Marilyn Manson")
    (format t "~&;;; ~A~%" line)))
