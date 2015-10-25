(load "../week2/palindrome.scm")

(define (p-score n)
  (define (p-score-iter n score)
    (if (palindrome? n)
        score
        (p-score-iter (+ n (reverse-number n))
                      (+ score 1))))
  (p-score-iter n 1))
