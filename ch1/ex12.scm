; rows and indexes both start at 0
(define (pascal row index)
  (cond ((= index 0) 1)
        ((= index row) 1)
        (else (+ (pascal (- row 1) index)
                 (pascal (- row 1) (- index 1))))))

; compute the fifth row
(pascal 4 0)
(pascal 4 1)
(pascal 4 2)
(pascal 4 3)
(pascal 4 4)

; compute the eighth row
(pascal 7 0)
(pascal 7 1)
(pascal 7 2)
(pascal 7 3)
(pascal 7 4)
(pascal 7 5)
(pascal 7 6)
(pascal 7 7)

