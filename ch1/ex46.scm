(define (iterative-improve good-enough? improve)
  (define (try guess)
    (if (good-enough? guess)
        guess
        (try (improve guess))))

  try)

(define (square x) (* x x))
(define (average a b) (/ (+ a b) 2.0))

(define (sqrt x)
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.001))
  (define (improve guess)
    (average guess (/ x guess)))

  ((iterative-improve good-enough? improve) 1.0))

; test it
(sqrt 81)

(define (fixed-point f first-guess)
  (define (good-enough? guess)
    (< (abs (- guess (f guess))) 0.00001))

  ((iterative-improve good-enough? f) first-guess))

; test it
(fixed-point cos 1.0)

