; First implementation
(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))

(define origin-frame car)
(define edge1-frame cadr)
(define edge2-frame caddr)

; test it
(define frame (make-frame 1 2 3))
(origin-frame frame)
(edge1-frame frame)
(edge2-frame frame)

; Second implementation
(define (make-frame2 origin edge1 edge2)
  (cons origin (cons edge1 edge2)))

(define origin-frame2 car)
(define edge1-frame2 cadr)
(define edge2-frame2 cddr)

; test it
(define frame2 (make-frame2 1 2 3))
(origin-frame2 frame2)
(edge1-frame2 frame2)
(edge2-frame2 frame2)

