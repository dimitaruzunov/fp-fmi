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

; finds the sum of all prime numbers in [a, b]
(define (sum-primes a b)
  (define (prime-ends-on-3? n)
    (and (= (remainder n 10) 3)
         (prime? n)))

  (define (term a) a)

  (define (next a) (+ a 1))

  (filter-accumulate prime-ends-on-3? + 0 term a next b))

; finds the sum of all fixed points of f in [a, b]
(define (fixed-points-sum f a b)
  (define (fixed-point? x)
    (= (f x) x))

  (define (id a) a)

  (define (1+ a) (+ a 1))

  (filter-accumulate fixed-point? + 0 id a 1+ b))

; calculates e^x
(define (e x N)
  (define (term a) (/ (expt x a) (factorial a)))

  (define (next a) (+ a 1))

  (accumulate + 0 term 0 next N))

; calculates sin(x)
(define (sinx x N)
  (define (term a)
    (* (expt -1 a)
       (/ (expt x (+ (* 2 a) 1))
          (factorial (+ (* 2 a) 1)))))

  (define (next a) (+ a 1))

  (accumulate + 0 term 0 next N))

; calculates cos(x)
(define (cosx x N)
  (define (term a)
    (* (expt -1 a)
       (/ (expt x (* 2 a))
          (factorial (* 2 a)))))

  (define (next a) (+ a 1))

  (accumulate + 0 term 0 next N))

; finds the sum of all integers x in [start, end] such that f(x) = value
(define (sum4 start end f value)
  (define (next i) (+ i 1))

  (define (term i) i)

  ; accumulate version
  ;(define (combiner result t)
  ;  (if (= (f t) value)
  ;      (+ result t)
  ;      result))
  ;(accumulate combiner 0 term start next end)

  (define (pred? t) (= (f t) value))

  (filter-accumulate pred? + 0 term start next end))
