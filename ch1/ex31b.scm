; Iterative version of product process.
(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))

  (iter a 1.0))

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

