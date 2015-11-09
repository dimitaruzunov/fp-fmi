(load "composition.scm")
(load "accumulate.scm")

(define (repeat f n)
  ;(if (zero? n)
  ;    (lambda (x) x)
  ;    (compose f (repeat f (- n 1))))

  ; Tail recursion version
  ;(define (repeat-iter i result)
  ;  (if (> i n)
  ;      result
  ;      (repeat-iter (+ i 1) (compose f result))))
  ;(repeat-iter 1 (lambda (x) x))

  (accumulate compose (lambda (x) x) (lambda (_) f) 1 (lambda (x) (+ x 1)) n))
