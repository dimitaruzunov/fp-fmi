(define (digits-decreasing? n)
  (define (last-digit n)
    (remainder n 10))

  (define (cut-last-digit n)
    (quotient n 10))

  (cond ((zero? (cut-last-digit n)) #t)
        ((> (last-digit n) (last-digit (cut-last-digit n))) #f)
        (else (digits-decreasing? (cut-last-digit n)))))
