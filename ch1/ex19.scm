; T_pq: a <- bq + aq + ap
;       b <- bp + aq
;
; Initial values: a0, b0
; First transformation:
;   a1 = b0*q + a0*q + a0*p
;   b1 = b0*p + a0*q
; Second transformation:
;   a2 = q(b0*p + a0*q) + q(b0*q + a0*q + a0*p) + p(b0*q + a0*q + a0*p)
;      = b0*p*q + a0*q*q + b0*q*q + a0*q*q + a0*p*q + b0*p*q + a0*p*q + a0*p*p
;      = b0(p*q + q*q + p*q) + a0(p*q + q*q + p*q) + a0(q*q + p*p)
;   b2 = p(b0*p + a0*q) + q(b0*q + a0*q + a0*p)
;      = b0*p*p + a0*p*q + b0*q*q + a0*q*q + a0*p*q
;      = b0(p*p + q*q) + a0(p*q + q*q + p*q)
;
; So:
;   p' = p*p + q*q
;   q' = 2*p*q + q*q

(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (* p p) (* q q))   ; compute p'
                   (+ (* 2 p q) (* q q)) ; compute q'
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))

; test it
(fib 0)
(fib 1)
(fib 2)
(fib 3)
(fib 4)
(fib 5)
(fib 6)
(fib 7)
(fib 8)
(fib 9)
(fib 10)
(fib 11)
(fib 12)
(fib 13)
(fib 14)
(fib 15)

