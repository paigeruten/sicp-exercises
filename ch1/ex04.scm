(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

; The if expression evaluates to a procedure, either the one defined as + or
; the one defined as -, and that procedure is applied with the arguments a and
; b. The result is that the function will return (+ a b) if b is positive,
; and will otherwise return (- a b).

