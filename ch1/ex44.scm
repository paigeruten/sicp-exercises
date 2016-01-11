(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (- n 1)))))

(define (average a b c)
  (/ (+ a b c)
     3.0))

(define dx 0.00001)

(define (smooth f)
  (lambda (x)
    (average (f (- x dx))
             (f x)
             (f (+ x dx)))))

(define (n-smoothed f n)
  ((repeated smooth n) f))

(define (square x) (* x x))

; test it
((n-smoothed square 3) 9)

