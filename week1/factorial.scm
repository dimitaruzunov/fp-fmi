(define (factorial n)
  ;(if (= n 0)
  ;    1
  ;    (* n (factorial (- n 1))))

  ; Tail recursion version
  (define (factorial-iter multiplier result)
    (if (< multiplier 2)
        result
        (factorial-iter (- multiplier 1) (* result multiplier))))
  (factorial-iter n 1))
