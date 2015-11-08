(define (exists? term a next b rel? x)
  (cond ((> a b) #f)
        ((rel? (term a) x) #t)
        (else (exists? term (next a) next b rel x))))
