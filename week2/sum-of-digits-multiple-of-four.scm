(define (sum-of-digits-multiple-of-four? n)
  (define (sum-of-digits n)
    (define (sum-of-digits-iter n sum)
      (if (= n 0)
          sum
          (sum-of-digits-iter (quotient n 10) (+ sum (remainder n 10)))))
    (sum-of-digits-iter n 0))
  (= (remainder (sum-of-digits n) 4) 0))

(define (three-digit-numbers-count)
  (define (three-digit-numbers-count-iter current count)
    (cond ((= current 1000) count)
          ((sum-of-digits-multiple-of-four? current)
           (three-digit-numbers-count-iter (+ current 1) (+ count 1)))
          (else (three-digit-numbers-count-iter (+ current 1) count))))
  (three-digit-numbers-count-iter 100 0))
