(define (filtered-accumulate combiner null-value term a next b filter)
  (cond ((> a b) null-value)
        ((filter a)
         (combiner (term a)
                   (filtered-accumulate combiner null-value term (next a) next b filter)))
        (else
         (filtered-accumulate combiner null-value term (next a) next b filter))))

(define (prime? n)
  (define (divides? a b)
    (= (remainder b a) 0))
  (define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor n (+ test-divisor 1)))))
  (define (smallest-divisor n)
    (find-divisor n 2))

  (= n (smallest-divisor n)))

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (identity x) x)
(define (inc x) (+ x 1))
(define (square x) (* x x))

(define (sum-of-squares-of-primes a b)
  (filtered-accumulate + 0 square a inc b prime?))

(define (product-of-relative-primes n)
  (define (relative-prime? i)
    (= (gcd n i) 1))

  (filtered-accumulate * 1 identity 1 inc (- n 1) relative-prime?))

(sum-of-squares-of-primes 2 15)
(product-of-relative-primes 20)

