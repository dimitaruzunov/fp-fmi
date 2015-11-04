(define (cube-sums? n)
  (define (cube x) (* x x x))

  (define (cube-sums-iter a b)
    (cond ((= n (+ (cube a) (cube b))) #t)
          ((> a (sqrt n)) #f)
          ((> b (sqrt n)) (cube-sums-iter (+ a 1) (+ a 1)))
          (else (cube-sums-iter a (+ b 1)))))
  (cube-sums-iter 0 0))

(define (count-cube-sums from to)
  (define (count-cube-sums-iter current result)
    (if (> current to)
        result
        (count-cube-sums-iter (+ current 1)
                              (+ result (if (cube-sums? current)
                                            1
                                            0)))))
  (count-cube-sums-iter from 0))
