(define (factorial n)
  (define (factorial-iter multiplier result)
    (if (< multiplier 2)
        result
        (factorial-iter (- multiplier 1) (* result multiplier))))
  (factorial-iter n 1))
