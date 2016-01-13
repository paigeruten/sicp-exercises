(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things))
                    answer))))
  (iter items ()))

; The results are in the opposite order because the list is built starting with
; the nil pointer, and each successive cons operation sticks the next result in
; the front of the list of previous results; whereas the recursive process
; sticks each result on the front of the list of the *rest* of the results,
; which produces the right order.
(square-list (list 1 2 3 4))

(define (square-list2 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer (square (car things))))))
  (iter items ()))

; Here, we are producing the same result but with a different convention for
; how sequences of data stored: each item is stored in cdr, while the pointer
; to the rest of the list is stored in car. This type of list will be
; incompatible with any of scheme's built-in list procedures, and doesn't
; help solve the problem anyway. (Though the way scheme prints out the data
; structure, it does show the results in the proper left-to-right order, so
; that's something.)
(square-list2 (list 1 2 3 4))

