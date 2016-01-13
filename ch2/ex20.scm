(define (same-parity x . xs)
  (define (filter-parity p xs)
    (cond ((null? xs) ())
          ((= (remainder (car xs) 2) p)
           (cons (car xs) (filter-parity p (cdr xs))))
          (else
           (filter-parity p (cdr xs)))))

  (cons x (filter-parity (remainder x 2) xs)))

; test it
(same-parity 1 2 3 4 5 6 7)
(same-parity 2 3 4 5 6 7)

