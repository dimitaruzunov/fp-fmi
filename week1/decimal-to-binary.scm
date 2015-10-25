(define (decimal-to-binary n)
  (if (= n 0)
      0
      (+ (* 10 (decimal-to-binary (quotient n 2))) (remainder n 2))))
