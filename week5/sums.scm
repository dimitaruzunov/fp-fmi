(load "../higher-order-functions/accumulate.scm")
(load "../week1/prime-number.scm")
(load "../week1/factorial.scm")

; x + x^2 + x^3 + ... + x^n
(define (sum1 x n)
  (define (term a) (expt x a))

  (define (next a) (+ a 1))

  (accumulate + 0 term 1 next n))

; x + x^2 + x^4 + x^8 + x^16 + ... + x^(2^n)
(define (sum2 x n)
  (define (term a) (expt x a))

  (define (next a) (* a 2))

  (accumulate + 0 term 1 next (expt 2 n)))

; x + 2x^2 + 3x^3 + ... + nx^n
(define (sum3 x n)
  (define (term a) (* a (expt x a)))

  (define (next a) (+ a 1))

  (accumulate + 0 term 1 next n))

(define (sum-primes a b)
  (define (prime-ends-on-3? n)
    (and (= (remainder n 10) 3)
         (prime? n)))

  (define (term a) a)

  (define (next a) (+ a 1))

  (filter-accumulate prime-ends-on-3? + 0 term a next b))

(define (fixed-points-sum f a b)
  (define (fixed-point? x)
    (= (f x) x))

  (define (id a) a)

  (define (1+ a) (+ a 1))

  (filter-accumulate fixed-point? + 0 id a 1+ b))

(define (e x N)
  (define (term a) (/ (expt x a) (factorial a)))

  (define (next a) (+ a 1))

  (accumulate + 0 term 0 next N))