; Recursive version of cont-frac process.
(define (cont-frac n d k)
  (define (iter i)
    (if (> i k)
        0.0
        (/ (n i)
           (+ (d i)
              (iter (+ i 1))))))

  (iter 1))

; Approximate 1/φ. Need 12 iterations to get it accurate to 4 decimal places.
(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           12)

