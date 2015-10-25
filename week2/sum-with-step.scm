(define (sum-step start end step)
  (define (sum-step-iter current sum compare)
    (if (compare current end)
        sum
        (sum-step-iter (+ current step) (+ sum current) compare)))

  (cond ((= start end) start)
        ((< start end) (sum-step-iter start 0 >))
        (else (sum-step-iter start 0 <))))
