(define (area a b c)
  (define semiperimeter (/ (+ a b c) 2))

  (sqrt (* semiperimeter
           (- semiperimeter a)
           (- semiperimeter b)
           (- semiperimeter c))))
