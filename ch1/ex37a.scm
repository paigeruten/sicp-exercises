(define (cont-frac n d k)
  (define (iter i result)
    (if (= i 0)
        result
        (iter (- i 1)
              (/ (n i ) (+ (d i) result)))))

  (iter k 0.0))

; Approximate 1/φ. Need 12 iterations to get it accurate to 4 decimal places.
(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           12)

