(define (square x) (* x x))

(define (sum-of-squares x y)
  (+ (square x) (square y)))

(define (max-sum-of-squares x y z)
  (cond ((and (<= x y) (<= x z))
         (sum-of-squares y z))
        ((and (<= y x) (<= y z))
         (sum-of-squares x z))
        (else
         (sum-of-squares x y))))

; test it
(max-sum-of-squares 3 2 4)

