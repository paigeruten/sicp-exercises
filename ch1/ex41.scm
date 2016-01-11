(define (double g)
  (lambda (x)
    (g (g x))))

(define (inc x) (+ x 1))

; Should return 7.
((double inc) 5)

; (double (double double)) returns a function that applies double to its
; argument four times. So in this case, (double (double (double (double inc))))
; will be applied with the argument 5, adding 16 to it to produce 21 as the
; result.
(((double (double double)) inc) 5)

