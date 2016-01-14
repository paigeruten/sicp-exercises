#lang racket

(require sicp-pict)

(define (split outside inside)
  (define (split-aux painter n)
    (if (= n 0)
        painter
        (let ((smaller (split-aux painter (- n 1))))
          (outside painter (inside smaller smaller)))))
  split-aux)

(define right-split (split beside below))
(define up-split (split below beside))

; test it, by defining corner-split and then square-limit

(define (corner-split painter n)
  (if (= n 0)
      painter
      (let ((up (up-split painter (- n 1)))
            (right (right-split painter (- n 1))))
        (let ((top-left (beside up up))
              (bottom-right (below right right))
              (corner (corner-split painter (- n 1))))
          (beside (below painter top-left)
                  (below bottom-right corner))))))

(define (square-limit painter n)
  (let ((quarter (corner-split painter n)))
    (let ((half (beside (flip-horiz quarter) quarter)))
      (below (flip-vert half) half))))

(paint-hi-res (square-limit einstein 2))

