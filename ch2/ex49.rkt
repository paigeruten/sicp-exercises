#lang racket

(require sicp-pict)

(define outline
  (segments->painter
    (list (make-segment (make-vect 0 0) (make-vect 0 0.99))
          (make-segment (make-vect 0 0.99) (make-vect 0.99 0.99))
          (make-segment (make-vect 0.99 0.99) (make-vect 0.99 0))
          (make-segment (make-vect 0.99 0) (make-vect 0 0)))))

(define x
  (segments->painter
    (list (make-segment (make-vect 0 0) (make-vect 1 1))
          (make-segment (make-vect 0 1) (make-vect 1 0)))))

(define diamond
  (segments->painter
    (list (make-segment (make-vect 0 0.5) (make-vect 0.5 1))
          (make-segment (make-vect 0.5 1) (make-vect 1 0.5))
          (make-segment (make-vect 1 0.5) (make-vect 0.5 0))
          (make-segment (make-vect 0.5 0) (make-vect 0 0.5)))))

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
          (make-segment (make-vect 0.15 0.67) (make-vect 0 0.85)))))

; test it
(paint outline)
(paint x)
(paint diamond)
(paint-hi-res wave)
