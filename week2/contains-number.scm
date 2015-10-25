(define (contains-number? n a)
  (define (digit-count n)
    (define (digit-count-iter n count)
      (if (< n 10)
          count
          (digit-count-iter (quotient n 10) (+ count 1))))
    (digit-count-iter n 1))

  ;(and (>= n a)
  ;     (or (= (remainder n (expt 10 (digit-count a))) a)
  ;         (contains-number? (quotient n 10) a)))

  ; Tail recursion version
  (cond ((< n a) #f)
        ((= (remainder n (expt 10 (digit-count a))) a) #t)
        (else (contains-number? (quotient n 10) a))))
