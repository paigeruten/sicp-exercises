(define (make-interval a b) (cons a b))
(define (lower-bound interval) (car interval))
(define (upper-bound interval) (cdr interval))

(define (interval-width interval)
  (/ (- (upper-bound interval) (lower-bound interval))
     2.0))

; Modified to display the widths of the two input intervals and the width of
; the result interval.
(define (add-interval x y)
  (newline)
  (display (interval-width x))
  (display " and ")
  (display (interval-width y))
  (display " -> ")
  (let ((result (make-interval (+ (lower-bound x) (lower-bound y))
                               (+ (upper-bound x) (upper-bound y)))))
    (display (interval-width result))
    result))

(define (sub-interval x y)
  (add-interval x
                (make-interval (- (upper-bound y))
                               (- (lower-bound y)))))

; Modified to display the widths of the two input intervals and the width of
; the result interval.
(define (mul-interval x y)
  (newline)
  (display (interval-width x))
  (display " and ")
  (display (interval-width y))
  (display " -> ")
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (let ((result (make-interval (min p1 p2 p3 p4)
                                 (max p1 p2 p3 p4))))
      (display (interval-width result))
      result)))

(define (div-interval x y)
  (mul-interval x
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y)))))

; Let a..b be the interval with a as the lower bound and b as the upper bound.
; Let c..d be another interval.
; The addition of these intervals is:
;
;     a..b + x..y = (a+x)..(b+y)
;
; The width of the result interval (a+x)..(b+y) is:
;
;       ((b+y) - (a+x)) / 2
;     = (b - a + y - x) / 2
;     = (b-a)/2 + (y-x)/2
;
; Which is the sum of the widths of the two input intervals. Therefore the
; width of the sum of two intervals is the sum of their widths.
(add-interval (make-interval 2 7)
              (make-interval 3 5))

; Here are two interval multiplications whose input intervals have the same
; widths, but produce results with different widths. Therefore, the width of
; the product of two intervals doesn't depend on their widths alone.
(mul-interval (make-interval 2 7)
              (make-interval 3 5))
(mul-interval (make-interval 3 8)
              (make-interval 4 6))

