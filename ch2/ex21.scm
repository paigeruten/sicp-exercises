(define (square-list items)
  (if (null? items)
      ()
      (cons (square (car items))
            (square-list (cdr items)))))

(define (square-list2 items)
  (map square items))

; test it
(square-list (list 1 2 3 4))
(square-list2 (list 1 2 3 4))

