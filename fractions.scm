(define (fst pair)
  (car pair))

(define (snd pair)
  (cdr pair))

(define (make-frac numer denom)
  (if (zero? numer)
      (cons 0 denom)
      (let ((g (gcd (abs numer) (abs denom))))
        (if (or (and (positive? numer)
                     (positive? denom))
                (and (negative? numer)
                     (negative? denom)))
            (cons (/ (abs numer) g) (/ (abs denom) g))
            (cons (- (/ (abs numer) g)) (/ (abs denom) g))))))

(define (numer frac)
  (fst frac))

(define (denom frac)
  (snd frac))

(define (add-frac frac1 frac2)
  (make-frac (+ (* (numer frac1) (denom frac2))
                (* (numer frac2) (denom frac1)))
             (* (denom frac1) (denom frac2))))

(define (subtract-frac frac1 frac2)
  (make-frac (- (* (numer frac1) (denom frac2))
                (* (numer frac2) (denom frac1)))
             (* (denom frac1) (denom frac2))))

(define (mult-frac frac1 frac2)
  (make-frac (* (numer frac1) (numer frac2))
             (* (denom frac1) (denom frac2))))

(define (div-frac frac1 frac2)
  (make-frac (* (numer frac1) (denom frac2))
             (* (denom frac1) (numer frac2))))
