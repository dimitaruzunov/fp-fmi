(define (string-repeat str n)
  (if (zero? n)
      ""
      (string-append str (string-repeat str (- n 1)))))

(define (fence n)
  (let ((dashes-count (round (+ 1 (log n)))))
    (string-append "{"
                   (string-repeat "-" dashes-count)
                   ">"
                   (number->string n)
                   "<"
                   (string-repeat "-" dashes-count)
                   "}")))
