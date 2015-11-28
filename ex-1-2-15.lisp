(make-string-input-stream "hello?")

(read (make-string-input-stream "hello!"))

(with-input-from-string (s "It's the multiverse!")
  (read s))

(with-output-to-string (out)
  (with-input-from-string (in "\"Can I ask who's calling?\"")
    (let ((io (make-two-way-stream in out)))
      (format io "~A It's the Jovian moon , IO!" (read io)))))
