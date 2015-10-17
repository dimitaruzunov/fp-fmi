(define (series a b n)
  (define (series-iter count current next)
    (if (= count n)
        current
        (series-iter (+ count 1) next (+ current next))))
  (series-iter 1 a b))

(define (lucas n) (series 2 1 n))

(define (fibonacci n) (series 1 1 n))

(define (summed-member n) (+ (lucas n) (fibonacci n)))

(define (nth-series-sum series n)
  (define (nth-series-sum-iter count sum)
    (if (> count n)
        sum
        (nth-series-sum-iter (+ count 1) (+ sum (series count)))))
  (nth-series-sum-iter 1 0))

(define (nth-lucas-sum n) (nth-series-sum lucas n))

(define (nth-fibonacci-sum n) (nth-series-sum fibonacci n))

(define (lucas-fib-diff n) (- (lucas n) (fibonacci n)))
