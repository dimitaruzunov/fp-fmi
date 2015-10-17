(define (sum-in-range a b)
  ;(if (= a b)
  ;    a
  ;    (+ a (sum-in-range (+ a 1) b)))

  ; Tail recursion version
  (define (sum-in-range-iter term result)
    (if (= term b)
        (+ result b)
        (sum-in-range-iter (+ term 1) (+ result term))))
  (sum-in-range-iter a 0))
