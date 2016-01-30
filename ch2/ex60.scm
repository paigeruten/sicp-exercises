; Stays the same.
(define (element-of-set? x set)
  (cond ((null? set) #f)
        ((equal? x (car set)) #t)
        (else (element-of-set? x (cdr set)))))

; Now a O(1) operation instead of O(n).
(define (adjoin-set x set)
  (cons x set))

; Stays the same.
(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2)
         (cons (car set1)
               (intersection-set (cdr set1) set2)))
        (else (intersection-set (cdr set1) set2))))

; Now a O(n) operation instead of O(n^2).
(define (union-set set1 set2)
  (append set1 set2))

; test it
(define set1 (list 2 3 2 1 3 2 2))
(define set2 (list 4 5 4 3 5 4 4))
(element-of-set? 5 set1)
(element-of-set? 5 set2)
(intersection-set set1 set2)
(union-set set1 set2)

; Sets obviously take up more space now, but inserting and computing unions are
; much faster operations. So you might use this representation when you're
; doing a lot of inserts? Maybe not, because then you'd possibly have a lot of
; duplicates in your representation, which would slow down searches even more,
; and use a lot of memory. So you'd want to use this representation in
; applications where you're doing lots of inserts, and you know you won't be
; inserting duplicates very often.

