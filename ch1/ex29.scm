(define (cube x) (* x x x))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

(define (simpson f a b n)
  (define h (/ (- b a) n))
  (define (inc x) (+ x 1))
  (define (simpson-term k)
    (* (cond ((or (= k 0) (= k n)) 1.0)
             ((odd? k) 4.0)
             (else 2.0))
       (f (+ a (* k h)))))

  (* (/ h 3.0)
     (sum simpson-term 0 inc n)))

(integral cube 0 1 0.01)
(integral cube 0 1 0.001)

(simpson cube 0 1 100)
(simpson cube 0 1 1000)

