(define (square x)
  (* x x))

(define (expmod-check n m)
  (if (and (not (= n 1))
           (not (= n (- m 1)))
           (= (remainder (square n) m) 1))
      0
      (remainder (square n) m)))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (expmod-check (expmod base (/ exp 2) m) m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (miller-rabin-test n)
  (define (iter a)
    (if (= a 0)
        #t
        (if (= (expmod a (- n 1) n) 0)
            #f
            (iter (- a 1)))))

  (cond ((= n 2) #t)
        ((even? n) #f)
        (else
         (iter (+ 1 (quotient n 2))))))

; test it
(miller-rabin-test 2)
(miller-rabin-test 3)
(miller-rabin-test 4)
(miller-rabin-test 5)
(miller-rabin-test 6)
(miller-rabin-test 7)
(miller-rabin-test 8)
(miller-rabin-test 9)
(miller-rabin-test 10)
(miller-rabin-test 11)
(miller-rabin-test 12)
(miller-rabin-test 13)
(miller-rabin-test 14)
(miller-rabin-test 15)
(miller-rabin-test 199)
(miller-rabin-test 1999)
(miller-rabin-test 19999)

; try it on some Carmichael numbers
(miller-rabin-test 561)
(miller-rabin-test 1105)
(miller-rabin-test 1729)
(miller-rabin-test 2465)
(miller-rabin-test 2821)
(miller-rabin-test 6601)

