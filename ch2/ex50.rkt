#lang racket

(require sicp-pict)

(define flip-vert
  (transform-painter (make-vect 0.0 1.0)
                     (make-vect 1.0 1.0)
                     (make-vect 0.0 0.0)))

(define flip-horiz
  (transform-painter (make-vect 1.0 0.0)
                     (make-vect 0.0 0.0)
                     (make-vect 1.0 1.0)))

(define rotate90
  (transform-painter (make-vect 1.0 0.0)
                     (make-vect 1.0 1.0)
                     (make-vect 0.0 0.0)))

(define rotate180
  (transform-painter (make-vect 1.0 1.0)
                     (make-vect 0.0 1.0)
                     (make-vect 1.0 0.0)))

(define rotate270
  (transform-painter (make-vect 0.0 1.0)
                     (make-vect 0.0 0.0)
                     (make-vect 1.0 1.0)))

; test it
(paint einstein)
(paint (flip-vert einstein))
(paint (flip-horiz einstein))
(paint (rotate90 einstein))
(paint (rotate180 einstein))
(paint (rotate270 einstein))
