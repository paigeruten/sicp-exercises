(define (square x)
  (* x x))

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

; Very imprecise result since the guess only needs to be 0.001 away.
(square (sqrt 0.0000123))

; Off by 9 on my machine, as the difference between the numbers becomes 0 with
; such large numbers.
(sqrt (square 100000000123456789))

(define (new-good-enough? guess old-guess)
  (< (/ (abs (- guess old-guess)) guess) 0.000001))

(define (new-sqrt-iter guess old-guess x)
  (if (new-good-enough? guess old-guess)
      guess
      (new-sqrt-iter (improve guess x)
                     guess
                     x)))

(define (new-sqrt x)
  (new-sqrt-iter 1.0 2.0 x))

; Way more precise.
(square (new-sqrt 0.0000123))

; This however is still off by 9. The numbers are just too big. Small numbers
; benifited more from the change, as large numbers were already doing pretty
; well with the old good-enough? test.
(new-sqrt (square 100000000123456789))

