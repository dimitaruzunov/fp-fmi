(load "../../higher-order-functions/accumulate.scm")

; task 1 -- function to count even digits of number n > 0
(define (num-even n)
  (if (zero? n)
      0
      (+ (if (even? (remainder n 10)) 1 0)
         (num-even (quotient n 10)))))

; task 2 -- calculate sin(x)
(define (accumulate-until combiner null-value term first next pred)
  (define (accumulate-until-iter result i)
    (let ((current-term (term i)))
      (if (pred current-term)
          (combiner result current-term)
          (accumulate-until-iter (combiner result current-term) (next i)))))
  (accumulate-until-iter null-value first))

(define (sinx x eps)
  (define (<eps t) (< (abs t) eps))

  (define (1+ i) (+ i 1))

  (define (fact n)
    (if (zero? n)
        1
        (* n (fact (- n 1)))))

  (define (term i)
    (* (expt -1 i)
       (/ (expt x (+ (* 2 i) 1))
          (fact (+ (* 2 i) 1)))))

  (accumulate-until + 0 term 0 1+ <eps))

; task 3
(define (y n x)
  (define (1+ i) (+ i 1))

  (define (2^ n)
    (accumulate * 1 (lambda (_) 2) 1 1+ n))

  (define (term1 i) (- x (2^ i)))

  (define (term2 i) (- x (2^ i) 1))

  (/ (accumulate * 1 term1 1 1+ n)
     (accumulate * 1 term2 1 1+ n)))

; task 4
(define (h m n f g)
  (define (derive f)
    (lambda (x)
      (/ (- (f (+ x 0.001))
            (f x))
         0.001)))

  (define (compose f g)
    (lambda (x) (f (g x))))

  (define (repeat f n)
    (if (= n 0)
        (lambda (x) x)
        (compose f (repeat f (- n 1)))))

  (define (derive-n f n)
    ((repeat derive n) f))

  (lambda (x)
    (define (1+ k) (+ 1 k))

    (define (term k)
      (define (term p) ((repeat g p) x))

      ((derive-n f k) (accumulate * 1 term 1 1+ m)))

    (accumulate + 0 term 1 1+ n)))
