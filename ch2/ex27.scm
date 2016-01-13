(define (deep-reverse l)
  (define (iter orig reversed)
    (if (null? orig)
        reversed
        (iter (cdr orig)
              (cons (if (pair? (car orig))
                        (deep-reverse (car orig))
                        (car orig))
                    reversed))))
  (iter l ()))

; test it
(deep-reverse (list (list 1 2) (list 3 4)))

