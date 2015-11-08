(define (different-digits? n)
  (define (last-digit n) (remainder n 10))

  (define (cut-last-digit n) (quotient n 10))

  (define (different-digits-iter i j)
    (cond ((zero? i) #t)
          ((zero? j)
           (different-digits-iter (cut-last-digit i)
                                  (cut-last-digit (cut-last-digit i))))
          ((= (last-digit i) (last-digit j)) #f)
          (else (different-digits-iter i (cut-last-digit j)))))

  (different-digits-iter n (cut-last-digit n)))
