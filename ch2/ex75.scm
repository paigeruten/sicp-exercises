(define (make-from-mag-ang r a)
  (define (dispatch op)
    (cond ((eq? op 'magnitude) r)
          ((eq? op 'angle) a)
          ((eq? op 'real-part) (* r (cos a)))
          ((eq? op 'imag-part) (* r (sin a)))
          (else
           (error "Unknown op -- MAKE-FROM-MAG-ANG" op))))
  dispatch)

(define (apply-generic op arg) (arg op))

; test it
(define n (make-from-mag-ang 2 45))
(apply-generic 'magnitude n)
(apply-generic 'angle n)
(apply-generic 'real-part n)
(apply-generic 'imag-part n)

