(define (adjoin-set x set)
  (cond ((null? set) (list x))
        ((< x (car set)) (cons x set))
        ((= x (car set)) set)
        (else (cons (car set) (adjoin-set x (cdr set))))))

; test it
(define set1 (list 1 3 6 10))
(adjoin-set 5 set1)
(adjoin-set 6 set1)
(adjoin-set 11 set1)

