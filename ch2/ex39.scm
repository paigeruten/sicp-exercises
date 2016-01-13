(define (reverse sequence)
  (fold-right (lambda (x y) (append y (list x))) () sequence))

(define (reverse2 sequence)
  (fold-left (lambda (x y) (cons y x)) () sequence))

; test it
(reverse (list 1 2 3 4 5))
(reverse2 (list 1 2 3 4 5))

