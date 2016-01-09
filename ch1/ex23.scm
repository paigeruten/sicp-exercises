(define (next n)
  (if (= n 2)
      3
      (+ n 2)))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define (square x)
  (* x x))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (search-for-primes start)
  (timed-prime-test start)
  (search-for-primes (+ start 3)))

; These primes take about 0.635 units of runtime.
;(search-for-primes 1000000000000)

; These ones take about 2.005 units of runtime.
;(search-for-primes 10000000000000)

; The speedup ratio is the same for both problem sizes: 1.62 rather than the
; expected 2.0. Maybe it's lower than expected because it now has the overhead
; of calling (next test-divisor) every iteration.

