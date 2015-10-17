(define (prime? n)
  (define square-root-of-n (sqrt n))

  (define (prime-iter divisor)
    (cond ((> divisor square-root-of-n) #t)
          ((= (remainder n divisor) 0) #f)
          (else (prime-iter (+ divisor 1)))))
  (prime-iter 2))
