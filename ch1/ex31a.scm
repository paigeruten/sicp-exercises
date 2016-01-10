(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

(define (factorial n)
  (define (identity x) x)
  (define (inc x) (+ x 1))

  (product identity 1 inc n))

(define (approximate-pi n)
  (define (pi-term k)
    (if (even? k)
        (/ k (+ k 1))
        (/ (+ k 1) k)))
  (define (inc x) (+ x 1))

  (* 4.0
     (product pi-term 2 inc n)))

(approximate-pi 1000)

