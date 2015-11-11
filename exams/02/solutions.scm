(load "../../higher-order-functions/accumulate.scm")

; task 1 -- find the minimal digit in number n > 0
(define (min-dig n)
  (if (< n 10)
      n
      (if (< (remainder n 10) (min-dig (quotient n 10)))
          (remainder n 10)
          (min-dig (quotient n 10)))))

; task 2 -- find x^(1/m)
(define (x^1/m x m eps)
  (define (helper result prev-result)
    (if (< (abs (- result prev-result)) eps)
        result
        (helper (* (/ 1.0 m)
                   (+ (* (- m 1) result)
                      (/ x (expt result (- m 1)))))
                result)))
  (helper x (+ x eps 1)))

; task 3
(define (s n)
  (define (double-fact n)
    (define (2+ i) (+ i 2))

    (define (id i) i)

    (accumulate * 1 id (if (even? n) 2 1) 2+ n))

  (define (x^n x n)
    (accumulate * 1 (lambda (_) x) 1 1+ n))

  (define (term i)
    (/ (+ (double-fact (+ (* 2 i) 1))
          (x^n (* 2 i) i))
       (double-fact (* 2 i))))

  (define (1+ i) (+ i 1))

  (accumulate + 0 term 1 1+ n))

; task 4
(define (h n m f g)
  (define (derive f dx)
    (lambda (x)
      (/ (- (f (+ x dx))
            (f x))
         dx)))

  (define (derive-n f n dx)
    (lambda (x)
      (if (= n 1)
          ((derive f dx) x)
          ((derive (derive-n f (- n 1) dx) dx) x))))

  (define (repeat f n)
    (lambda (x)
      (if (zero? n)
          x
          (f ((repeat f (- n 1)) x)))))

  (lambda (x)
    (define (1+ i) (+ i 1))

    (define (term k)
      (define (term p) ((derive-n g p 0.001) x))

      ((repeat f k) (accumulate + 0 term 1 1+ m)))

    (accumulate * 1 term 1 1+ n)))
