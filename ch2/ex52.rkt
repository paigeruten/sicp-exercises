#lang racket

(require sicp-pict)

(define wave
  (segments->painter
    (list (make-segment (make-vect 0 0.7) (make-vect 0.15 0.45))
          (make-segment (make-vect 0.15 0.45) (make-vect 0.3 0.66))
          (make-segment (make-vect 0.3 0.66) (make-vect 0.33 0.6))
          (make-segment (make-vect 0.33 0.6) (make-vect 0.27 0))
          ;---
          (make-segment (make-vect 0.39 0) (make-vect 0.5 0.4))
          (make-segment (make-vect 0.5 0.4) (make-vect 0.61 0))
          ;---
          (make-segment (make-vect 0.73 0) (make-vect 0.66 0.55))
          (make-segment (make-vect 0.66 0.55) (make-vect 1 0.15))
          ;---
          (make-segment (make-vect 1 0.42) (make-vect 0.75 0.69))
          (make-segment (make-vect 0.75 0.69) (make-vect 0.67 0.69))
          (make-segment (make-vect 0.67 0.69) (make-vect 0.7 0.85))
          (make-segment (make-vect 0.7 0.85) (make-vect 0.67 1))
          ;---
          (make-segment (make-vect 0.33 1) (make-vect 0.3 0.85))
          (make-segment (make-vect 0.3 0.85) (make-vect 0.33 0.69))
          (make-segment (make-vect 0.33 0.69) (make-vect 0.3 0.69))
          (make-segment (make-vect 0.3 0.69) (make-vect 0.15 0.67))
          (make-segment (make-vect 0.15 0.67) (make-vect 0 0.85))
          ;---
          (make-segment (make-vect 0.4 0.9) (make-vect 0.4 0.87)) ; left eye
          (make-segment (make-vect 0.6 0.9) (make-vect 0.6 0.87)) ; right eye
          (make-segment (make-vect 0.4 0.82) (make-vect 0.43 0.79))
          (make-segment (make-vect 0.43 0.79) (make-vect 0.57 0.79))
          (make-segment (make-vect 0.57 0.79) (make-vect 0.6 0.82)))))

(define (split outside inside)
  (define (split-aux painter n)
    (if (= n 0)
        painter
        (let ((smaller (split-aux painter (- n 1))))
          (outside painter (inside smaller smaller)))))
  split-aux)

(define right-split (split beside below))
(define up-split (split below beside))

(define (corner-split painter n)
  (if (= n 0)
      painter
      (let ((up (up-split painter (- n 1)))
            (right (right-split painter (- n 1))))
        (let ((top-left up)
              (bottom-right right)
              (corner (corner-split painter (- n 1))))
          (beside (below painter top-left)
                  (below bottom-right corner))))))

(define (square-of-four tl tr bl br)
  (lambda (painter)
    (let ((top (beside (tl painter) (tr painter)))
          (bottom (beside (bl painter) (br painter))))
      (below bottom top))))

(define (square-limit painter n)
  (let ((combine4 (square-of-four identity rotate90
                                  rotate180 rotate270)))
    (combine4 (corner-split painter n))))

; test it
(paint-hi-res (square-limit wave 3))
(paint-hi-res (square-limit einstein 3))
