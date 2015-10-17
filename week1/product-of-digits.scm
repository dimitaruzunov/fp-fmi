(define (product-digits n)
  (define (cut-last-digit n)
    (remainder n 10))

  (define (cut-number-from-last-digit n)
    (quotient n 10))

  ;(if (= n 0)
  ;    1
  ;    (* (cut-last-digit n)
  ;       (product-digits (cut-number-from-last-digit n))))

  ; Tail recursion version
  (define (product-digits-iter n result)
    (if (= n 0)
        result
        (product-digits-iter (cut-number-from-last-digit n)
                             (* result (cut-last-digit n)))))
  (product-digits-iter n 1))
