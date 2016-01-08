(define (fast-expt b n)
  (fast-expt-iter b n 1))

(define (fast-expt-iter b n a)
  (if (= n 0)
      a
      (if (even? n)
          (fast-expt-iter (* b b) (/ n 2) a)
          (fast-expt-iter b (- n 1) (* a b)))))

; test it
(fast-expt 2 4)
(fast-expt 2 8)
(fast-expt 2 16)
(fast-expt 2 32)
(fast-expt 2 5)
(fast-expt 2 10)
(fast-expt 2 15)
(fast-expt 3 4)
(fast-expt 7 3)

