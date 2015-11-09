(load "exists.scm")

(define (prime? n)
  (define (divides? d n)
    (zero? (remainder n d)))

  (define (id n) n)

  (define (1+ n) (+ n 1))

  (if (= n 1)
      #f
      (not (exists? id 2 1+ (sqrt n) divides? n))))
