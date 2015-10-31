(load "accumulate.scm")

(define (integral f a b h)
  (define (next x) (+ x h))

  (* h (accumulate + 0 f (+ a (/ h 2)) next b)))
