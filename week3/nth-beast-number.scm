(define (nth-beast-number n)
  (define (nth-beast-number-iter count number)
    (if (= count n)
        number
        (nth-beast-number-iter (+ count 1) (+ (* number 1000) 666))))
  (nth-beast-number-iter 1 666))
