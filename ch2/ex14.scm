(define (make-interval a b) (cons a b))
(define (lower-bound interval) (car interval))
(define (upper-bound interval) (cdr interval))

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))
(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))
(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

(define (make-center-percent c p)
  (make-center-width c (* c p)))
(define (percent i)
  (/ (width i) (center i)))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (sub-interval x y)
  (add-interval x
                (make-interval (- (upper-bound y))
                               (- (lower-bound y)))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (if (and (<= (lower-bound y) 0)
           (>= (upper-bound y) 0))
      (error "won't divide by an interval spanning zero")
      (mul-interval x
                    (make-interval (/ 1.0 (upper-bound y))
                                   (/ 1.0 (lower-bound y))))))

(define (print-center-percent i)
  (newline)
  (display "center: ")
  (display (center i))
  (display " | percent: ")
  (display (percent i)))

(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))

(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval one
                  (add-interval (div-interval one r1)
                                (div-interval one r2)))))

; Reproduce Lem E. Tweakit's issue.
(par1 (make-center-width 6.8 0.10)
      (make-center-width 4.7 0.05))
(par2 (make-center-width 6.8 0.10)
      (make-center-width 4.7 0.05))

; Some more tests.
(define A (make-center-width 5.0 0.05))
(define B (make-center-width 10.0 0.03))
(print-center-percent (div-interval A A))
(print-center-percent (div-interval A B))
(print-center-percent (div-interval B A))
(print-center-percent (div-interval B B))

