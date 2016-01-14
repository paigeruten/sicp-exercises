(define make-vect cons)
(define xcor-vect car)
(define ycor-vect cdr)

(define make-segment cons)
(define start-segment car)
(define end-segment cdr)

; test it
(define seg (make-segment (make-vect 2 3) (make-vect 6 7)))
(start-segment seg)
(end-segment seg)

