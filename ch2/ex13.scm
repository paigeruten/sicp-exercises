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

; Modified to show the percentage tolerances of the inputs and the percentage
; tolerance of the result.
(define (mul-interval x y)
  (newline)
  (display (percent x))
  (display " and ")
  (display (percent y))
  (display " -> ")
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (let ((result (make-interval (min p1 p2 p3 p4)
                                 (max p1 p2 p3 p4))))
      (display (percent result))
      result)))

(define (div-interval x y)
  (if (and (<= (lower-bound y) 0)
           (>= (upper-bound y) 0))
      (error "won't divide by an interval spanning zero")
      (mul-interval x
                    (make-interval (/ 1.0 (upper-bound y))
                                   (/ 1.0 (lower-bound y))))))

(define (recip-interval x)
  (make-interval (/ 1.0 (upper-bound x))
                 (/ 1.0 (lower-bound x))))

; Let a..b be an interval with lower bound a and upper bound b. Its
; percentage tolerance is:
;
;       (b-a)/2 / (a+b)/2
;     = (b-a)/2 * 2/(a+b)
;     = (b-a)/(b+a)
;
; Let c..d be another interval with percentage tolerance (d-c)/(d+c). Then
; the multiplication of a..b and c..d, assuming positive numbers, is:
;
;     ac..bd
;
; With percentage tolerance:
;
;     (bd-ac)/(bd+ac)
;
; From experimentation, it seems that with low percentage tolerances, the
; tolerance of the result is approximately the sum of the tolerances of the
; inputs. Let's add together the tolerances of the inputs:
;
;       (b-a)/(b+a) + (d-c)/(d+c)
;     = ((b-a)(d+c) + (d-c)(b+a)) / (b+a)(d+c)
;     = (bd - ad + bc - ac + bd - bc + ad - ac) / (bd + ad + bc + ac)
;     = (2bd - 2ac) / (bd + ad + bc + ac)
;     = 2(bd - ac) / (bd + ac + ad + bc)
;
; This is equal to the result's percentage tolerance if bd+ac = ad+bc. So
; bd+ac must be close to ad+bc when the tolerances are small, making the sum
; of the tolerances a good approximation to the tolerance of the result.
(mul-interval (make-center-percent 4 0.1)
              (make-center-percent 6 0.2))

