(define (pow b n)
  ;(cond ((< n 0) (pow (/ 1 b) (* n -1)))
  ;      ((= n 0) 1)
  ;      (else (* b (pow b (- n 1)))))

  (define (even? n) (if (= (remainder n 2) 0) #t #f))

  (define (square b) (* b b))

  ; Quick pow
  ;(define (qpow b n)
  ;  (cond ((< n 0) (qpow (/ 1 b) (* n -1)))
  ;        ((= n 0) 1)
  ;        ((= n 1) b)
  ;        ((even? n) (qpow (square b) (/ n 2)))
  ;        (else (* b (qpow (square b) (/ (- n 1) 2))))))
  ;(qpow b n)

  ; Quick pow tail recursion version
  (define (qpow-iter b n result)
    (cond ((< n 0) (qpow-iter (/ 1 b) (* n -1) result))
          ((= n 0) result)
          ((= n 1) (* result b))
          ((even? n) (qpow-iter (square b) (/ n 2) result))
          (else (qpow-iter (square b) (/ (- n 1) 2) (* result b)))))
  (qpow-iter b n 1))