(define (accumulate combiner null-value term a next b)
  ;(if (> a b)
  ;    null-value
  ;    (combiner (term a)
  ;              (accumulate combiner null-value term (next a) next b)))

  ; Tail recursion version
  (define (accumulate-iter i result)
    (if (> i b)
        result
        (accumulate-iter (next i) (combiner result (term i)))))
  (accumulate-iter a null-value))

(define (filter-accumulate predicate combiner null-value term a next b)
  ;(cond ((> a b) null-value)
  ;      ((predicate (term a))
  ;       (combiner (term a)
  ;                (filter-accumulate predicate combiner null-value
  ;                                   term (next a) next b)))
  ;      (else (filter-accumulate predicate combiner null-value
  ;                               term (next a) next b)))

  ; Tail recursion version
  (define (filter-accumulate-iter i result)
    (if (> i b)
        result
        (filter-accumulate-iter (next i) (if (predicate (term i))
                                             (combiner result (term i))
                                             result))))
  (filter-accumulate-iter a null-value))

(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (product term a next b)
  (accumulate * 1 term a next b))

(define (exists? term a next b rel? x)
  (cond ((> a b) #f)
        ((rel? (term a) x) #t)
        (else (exists? term (next a) next b rel x))))
