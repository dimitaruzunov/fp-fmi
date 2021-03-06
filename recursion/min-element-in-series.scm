; 4i^2 - 13in + 17n^2, i = 1, 2, ..., n
(define (min-element n)
  (define (min-element-rec i)
    (if (= i n)
        (* 8 n n)
        (if (< (+ (* 4 i i) (* -13 i n) (* 17 n n)) (min-element-rec (+ i 1)))
            (+ (* 4 i i) (* -13 i n) (* 17 n n))
            (min-element-rec (+ i 1)))))
  ;(min-element-rec 1)

  ; Tail recursion version
  (define (min-element-iter i result)
    (if (= i n)
        result
        (min-element-iter (+ i 1)
                          (if (< (+ (* 4 (+ i 1) (+ i 1))
                                    (* -13 (+ i 1) n) (* 17 n n))
                                 result)
                              (+ (* 4 (+ i 1) (+ i 1))
                                 (* -13 (+ i 1) n) (* 17 n n))
                              result))))
  (min-element-iter 1 (+ (* 17 n n) (* -13 n) 4)))
