(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))

; Representation #1: store the top-left point and the width and height
(define (make-rect top-left width height)
  (cons top-left (cons width height)))
(define (rect-x rect) (x-point (car rect)))
(define (rect-y rect) (y-point (car rect)))
(define (rect-width rect) (car (cdr rect)))
(define (rect-height rect) (cdr (cdr rect)))

; Representation #2: store the top-left point and the bottom-right point
;(define (make-rect top-left width height)
;  (cons top-left (make-point (+ (x-point top-left) width)
;                             (+ (y-point top-left) height))))
;(define (rect-x rect) (x-point (car rect)))
;(define (rect-y rect) (y-point (car rect)))
;(define (rect-width rect) (- (x-point (cdr rect)) (x-point (car rect))))
;(define (rect-height rect) (- (y-point (cdr rect)) (y-point (car rect))))

(define (perimeter rect)
  (+ (* 2 (rect-width rect))
     (* 2 (rect-height rect))))

(define (area rect)
  (* (rect-width rect)
     (rect-height rect)))

; test it
(define my-rect (make-rect (make-point 3 4) 2 5))
(perimeter my-rect)
(area my-rect)

