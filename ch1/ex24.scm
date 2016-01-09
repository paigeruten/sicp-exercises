(define (square x)
  (* x x))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

; fast-prime? is way too fast to measure it on individual primes. So I modified
; search-for-primes to search for n primes and measure the time taken to find
; that many primes.
(define (search-for-primes n start start-time)
  (cond ((= n 0)
         (newline)
         (display "*** Elapsed time: ")
         (display (- (runtime) start-time))
         (newline))
        ((fast-prime? start 5) (search-for-primes (- n 1) (+ start 3) start-time))
        (else (search-for-primes n (+ start 3) start-time))))

; These primes take 1.97 units of runtime.
;(search-for-primes 1000 1000000000000 (runtime))

; These primes take 1.04 units of runtime.
;(search-for-primes 1000 1000000000 (runtime))

; These ones take 0.45 units of runtime.
;(search-for-primes 1000 1000000 (runtime))

; Increasing the problem size by 1000 seems to increase the time taken by a
; factor of 2, which is about what I'd expect from a O(log n) algorithm.

