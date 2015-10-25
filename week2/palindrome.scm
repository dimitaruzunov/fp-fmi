(define (reverse-number n)
  (define (reverse-number-iter n result)
    (if (= n 0)
        result
        (reverse-number-iter (quotient n 10)
                             (+ (* result 10) (remainder n 10)))))
  (reverse-number-iter n 0))

(define (palindrome? n)
  (= n (reverse-number n)))

(define (contains-palindrome? n)
  (define (contains-palindrome-at-front? n)
    (and (> n 9)
         (or (palindrome? n) (contains-palindrome-at-front? (quotient n 10)))))

  (define (remove-digit-at-front n)
    (reverse-number (quotient (reverse-number n) 10)))

  (and (> n 9)
       (or (contains-palindrome-at-front? n)
           (contains-palindrome? (remove-digit-at-front n)))))

(define (palindromes-count-in-range a b)
  (define (palindromes-count-in-range-iter current count)
    (cond ((> current b) count)
          ((palindrome? current)
           (palindromes-count-in-range-iter (+ current 1) (+ count 1)))
          (else (palindromes-count-in-range-iter (+ current 1) count))))
  (palindromes-count-in-range-iter a 0))
