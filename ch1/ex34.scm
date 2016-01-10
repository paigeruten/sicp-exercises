(define (f g)
  (g 2))

(define (square x) (* x x))

(f square)

(f (lambda (z) (* z (+ z 1))))

; This evalutes to (f 2), which evaluates to (2 2), which fails because 2 is
; not a procedure.
(f f)

