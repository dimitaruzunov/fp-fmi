(load "exists.scm")
(load "accumulate.scm")

; finds if element of i^4 + 3in^2 + n^4, i = 1, 2, ..., n such that
; element divides x exists
(define (exists1? n x)
  (define (divisible? t x)
    (zero? (remainder t x)))

  (define (term i) (+ (* i i i i) (* 3 i n n) (* n n n n)))

  (define (1+ i) (+ i 1))

  (exists? term 1 1+ n divisible? x))

; finds if element of i^4 + 3in^2 + n^4, i = 1, 2, ..., n such that
; element equals x exists
(define (exists2? n x)
  (define (term i) (+ (* i i i i) (* 3 i n n) (* n n n n)))

  (define (1+ i) (+ i 1))

  (exists? term 1 1+ n = x))

; finds if element of x^i / i!, i = 1, 2, ..., n such that
; element is in [a, b] exists
(define (exists3? n x a b)
  (define (in-range? t b)
    (and (>= t a) (<= t b)))

  (define (term i)
    (define (term j) (/ x j))

    (product term 1 1+ i))

  (define (1+ i) (+ i 1))

  (exists? term 1 1+ n in-range? b))
