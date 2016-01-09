(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

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

; These primes take about 1.03 units of runtime.
;(search-for-primes 1000000000000)

; These ones take about 3.26 units of runtime. 3.26/1.03 = 3.165, very close to sqrt(10) = 3.162!
;(search-for-primes 10000000000000)

