(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(fold-right / 1 (list 1 2 3))
;=> (/ 1 (/ 2 (/ 3 1)))
;=> 3/2

(fold-left / 1 (list 1 2 3))
;=> (/ (/ (/ 1 1) 2) 3)
;=> 1/6

(fold-right list () (list 1 2 3))
;=> (list 1 (list 2 (list 3 ())))
;=> (1 (2 (3 ())))

(fold-left list () (list 1 2 3))
;=> (list (list (list () 1) 2) 3)
;=> (((() 1) 2) 3)

; op needs to satisfy the commutative property to guarantee the same result
; from either fold-right or fold-left. e.g. + and * are commutative, but - and
; / are not, and will often produce different results between fold-right and
; fold-left.

