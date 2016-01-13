(define (reverse l)
  (define (iter orig reversed)
    (if (null? orig)
        reversed
        (iter (cdr orig)
              (cons (car orig) reversed))))
  (iter l ()))

; test it
(reverse (list 1 2 3 4 5))

