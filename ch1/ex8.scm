(define (square x)
  (* x x))

(define (cube x)
  (* x x x))

(define (improve guess x)
  (/ (+ (/ x (square guess))
        (* 2 guess))
     3))

(define (good-enough? guess old-guess)
  (< (/ (abs (- guess old-guess)) guess) 0.000001))

(define (cbrt-iter guess old-guess x)
  (if (good-enough? guess old-guess)
      guess
      (cbrt-iter (improve guess x)
                 guess
                 x)))

(define (cbrt x)
  (cbrt-iter 1.0 2.0 x))

; test it
(cbrt 8)
(cbrt 27)
(cbrt 81)
(cube (cbrt 0.0000012345))
(cbrt (cube 25342))

