(define (c n m)
  ;(if (= m 0)
  ;    1
  ;    (* (/ n m) (c (- n 1) (- m 1))))

  ; Tail recursion version
  (define (c-iter n m result)
    (if (zero? m)
        result
        (c-iter (- n 1) (- m 1) (* result (/ n m)))))
  (c-iter n m 1))
