(define (circle? circle-x circle-y radius point-x point-y)
  (define (square x)
    (* x x))

  (<= (+ (square (- point-x circle-x))
         (square (- point-y circle-y)))
      (square radius)))
