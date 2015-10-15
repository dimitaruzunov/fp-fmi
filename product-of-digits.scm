(define (product-digits n)
  (define (cut-last-digit n)
    (remainder n 10))

  (define (cut-number-from-last-digit n)
    (quotient n 10))

  (if (= n 0)
      1
      (* (cut-last-digit n)
         (product-digits (cut-number-from-last-digit n)))))
