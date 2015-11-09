(load "accumulate.scm")

(define (integral f a b h)
  (define (next x) (+ x h))

  (* h (accumulate + 0 f (+ a (/ h 2)) next b)))

(define (integral2 f a b n)
  (define h (/ (- b a) n))

  (define (term a))
  )
