(load "../week1/decimal-to-binary.scm")
(load "../week2/palindrome.scm")

(define (next-hack n)
  (define (one-count n)
    (define (one-count-iter n count)
      (if (< n 10)
          count
          (one-count-iter (quotient n 10)
                          (+ count (if (= (remainder n 10) 1) 1 0)))))
    (one-count-iter n 1))

  (if (and (palindrome? (decimal-to-binary (+ n 1)))
           (odd? (one-count (decimal-to-binary (+ n 1)))))
      (+ n 1)
      (next-hack (+ n 1))))
