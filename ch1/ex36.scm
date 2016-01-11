(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (newline)
      (display next)
      (if (close-enough? guess next)
        next
        (try next))))
  (try first-guess))

(define (average a b)
  (/ (+ a b)
     2))

(define (f x) (/ (log 1000) (log x)))

; Solve x^x = 1000. (Takes 34 steps.)
(fixed-point f 2.0)

; Solve x^x = 1000 with average damping. (Takes only 9 steps.)
(fixed-point (lambda (x) (average x (f x))) 2.0)

