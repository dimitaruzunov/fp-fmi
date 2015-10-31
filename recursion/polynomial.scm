(define (p n x)
  (define (p-iter i currentX result)
    (if (> i n)
        result
        (p-iter (+ i 1) (* currentX x) (+ result (* i currentX)))))
  (p-iter 1 x 0))
