; We are defining the list of subsets of s as the list of subsets of s except
; for the first element, appended to that list of subsets but where the first
; element is added to each subset. This gives all subsets of s.
(define (subsets s)
  (if (null? s)
      (list ())
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (xs) (cons (car s) xs)) rest)))))

; test it
(subsets (list 1 2 3))

