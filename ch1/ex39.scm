(define (cont-frac n d k)
  (define (iter i result)
    (if (= i 0)
        result
        (iter (- i 1)
              (/ (n i ) (+ (d i) result)))))

  (iter k 0.0))

(define (tan-cf x k)
  (cont-frac (lambda (i) (if (= i 1) x (- (* x x))))
             (lambda (i) (- (* i 2) 1))
             k))

; test it
(tan-cf 1.234 50)
(tan-cf 3.14159 50)

