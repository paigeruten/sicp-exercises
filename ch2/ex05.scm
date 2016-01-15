(define (cons a b)
  (* (expt 2 a)
     (expt 3 b)))

(define (car x)
  (if (even? x)
      (+ 1 (car (/ x 2)))
      0))

(define (cdr x)
  (if (= (remainder x 3) 0)
      (+ 1 (cdr (/ x 3)))
      0))

; test it
(car (cons 4 5))
(cdr (cons 4 5))
(car (cons 1 0))
(cdr (cons 1 0))
(car (cons 0 1))
(cdr (cons 0 1))
(car (cons 0 0))
(cdr (cons 0 0))

