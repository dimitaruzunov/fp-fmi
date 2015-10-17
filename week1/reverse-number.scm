(define (reverse-number n)
  (define (reverse-number-iter n result)
    (if (= n 0)
        result
        (reverse-number-iter (quotient n 10)
                             (+ (* result 10) (remainder n 10)))))
  (reverse-number-iter n 0))
