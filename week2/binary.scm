(define (string-reverse str)
  (define (string-reverse-iter i result)
    (if (negative? i)
        result
        (string-reverse-iter (- i 1)
                             (string-append result (~a (string-ref str i))))))
  (string-reverse-iter (- (string-length str) 1) ""))

(define (to-binary-string n)
  ;(if (zero? n)
  ;    ""
  ;    (string-append (to-binary-string (quotient n 2)) (~a (remainder n 2))))

  ; Tail recursion version
  (define (to-binary-string-iter n result)
    (if (zero? n)
        result
        (to-binary-string-iter (quotient n 2)
                               (string-append (~a (remainder n 2)) result))))
  (to-binary-string-iter n ""))

(define (from-binary-string bin-str)
  (let ((num-len (string-length bin-str)))
    (define (from-bin-str-iter i result)
      (if (= i num-len)
          result
          (from-bin-str-iter (+ i 1)
                             (+ result
                                (* (string->number (~a (string-ref bin-str i)))
                                   (expt 2 (- num-len i 1)))))))
    (from-bin-str-iter 0 0)))
