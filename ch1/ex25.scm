(define (fast-expt b n)
  (fast-expt-iter b n 1))

(define (fast-expt-iter b n a)
  (if (= n 0)
      a
      (if (even? n)
          (fast-expt-iter (* b b) (/ n 2) a)
          (fast-expt-iter b (- n 1) (* a b)))))

; This is a very bad implementation of expmod. fast-expt generates enormous
; numbers very fast, especially when checking even just moderately large
; numbers for primality as we have been doing. With numbers this size, scheme
; is forced to use some kind of bignumber representation which slows down the
; math operations greatly. In fact, when I ran this version of expmod on just
; 10-digit numbers, it ran for half a minute before I gave up and stopped it.
(define (expmod base exp m)
  (remainder (fast-expt base exp) m))

