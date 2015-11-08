(load "../higher-order-functions/accumulate.scm")

(define (factorial n)
  (accumulate * 1 (lambda (x) x) 1 (lambda (x) (+ x 1)) n))

(define (pow b n)
  (accumulate * 1 (lambda (_) b) 1 (lambda (x) (+ x 1)) n))

(define (variation k n)
  (accumulate * 1 (lambda (x) x) (+ n (- k) 1) (lambda (x) (+ x 1)) n))

(define (combination k n)
  (/ (variation k n) (factorial k)))
