(define zero (lambda (f) (lambda (x) x)))

(define one (lambda (f) (lambda (x) (f x))))

(define two (lambda (f) (lambda (x) (f (f x)))))

(define (church-to-int n)
  ((n (lambda (x) (+ x 1))) 0))

(define (add-church a b)
  (lambda (f) (lambda (x) ((a f) ((b f) x)))))

; test it
(church-to-int zero)
(church-to-int one)
(church-to-int two)
(church-to-int (add-church one two))
(church-to-int (add-church two two))
(church-to-int (add-church zero zero))
(church-to-int (add-church zero one))
(church-to-int (add-church zero two))
(church-to-int (add-church one one))
