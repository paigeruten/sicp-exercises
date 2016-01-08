(define (double x) (+ x x))
(define (halve x) (/ x 2))

(define (* a b)
  (if (= b 0)
      0
      (if (even? b)
          (* (double a) (halve b))
          (+ a (* a (- b 1))))))

; test it
(* 3 4)
(* 12 12)
(* 7 7)
(* 9 11)
(* 8 16)

