(define (double x) (+ x x))
(define (halve x) (/ x 2))

(define (* a b)
  (*-iter a b 0))

(define (*-iter a b c)
  (if (= b 0)
      c
      (if (even? b)
          (*-iter (double a) (halve b) c)
          (*-iter a (- b 1) (+ c a)))))

; test it
(* 3 4)
(* 12 12)
(* 7 7)
(* 9 11)
(* 8 16)

