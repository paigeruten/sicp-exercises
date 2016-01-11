(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (- n 1)))))

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
        next
        (try next))))
  (try first-guess))

(define (average a b)
  (/ (+ a b)
     2.0))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (expt x n)
  (if (= n 0)
      1
      (* x (expt x (- n 1)))))

(define (log2 x)
  (/ (log x) (log 2)))

; Through experimentation, I found that floor(log2(n)) average damps are needed
; to compute the nth root.
(define (nth-root x n)
  (let ((average-damps (repeated average-damp (floor (log2 n))))
        (f (lambda (y) (/ x (expt y (- n 1))))))
    (fixed-point (average-damps f) 1.0)))

; test it
(nth-root 9 2)
(nth-root 27 3)
(nth-root 81 4)
(nth-root 32 5)
(nth-root 64 6)
(nth-root 128 7)
(nth-root 256 8)
(nth-root 512 9)
(nth-root 1024 10)
(nth-root 2048 11)
(nth-root 4096 12)
(nth-root 8192 13)
(nth-root 16384 14)
(nth-root 32768 15)
(nth-root 65536 16)
(nth-root 100 31)
(nth-root 100 32)

