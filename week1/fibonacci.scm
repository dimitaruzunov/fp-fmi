(define (fibonacci n)
  ;(cond ((= n 1) 0)
  ;      ((= n 2) 1)
  ;      (else (+ (fibonacci (- n 1)) (fibonacci (- n 2)))))

  ; Tail recursion version
  (define (fibonacci-iter count current next)
    (if (= count n)
        current
        (fibonacci-iter (+ count 1) next (+ current next))))
  (fibonacci-iter 1 0 1))
