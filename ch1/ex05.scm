(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

(test 0 (p))

; Applicative-order: The arguments of (test 0 (p)) will be evaluated before
; applying the test function, so the p function will be called and won't
; terminate.
;
; Normal-order: The 0 and (p) arguments will get substituted into the body of
; the test function without being evaluated. Since the x argument given is 0,
; the consequent expression of the if won't be evaluated, and the test function
; will return 0, terminating without ever calling p.

